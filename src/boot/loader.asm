[org 0x1000]

dw 0x55aa; 魔术，判断错误

mov si, loading
call print

; 内存检测
; biox 0x15 0xe802 系统调用实现
; ards 保存： 基址, 长度, 类型(1可用，2不可用)
detect_memory:
    xor ebx, ebx; 将ebx置0

    ; es:di 结构体的缓存位置
    mov ax, 0
    mov es, ax
    mov edi, ards_buffer
    
    ; 固定签名
    mov edx, 0x534d4150

.next:
    ; 子功能号
    mov eax, 0xe820
    ; ards 结构的大小
    mov ecx, 20
    int 0x15

    ; 如果 cf 置位，表示出错
    jc error

    ; 缓存指针指向下一个结构体
    add di, cx

    ; 结构体数量+1
    inc dword [ards_count]

    cmp ebx, 0
    jnz .next
    
    mov si, detecting
    call print

    ; 实模式下16位地址线不能更改
    ; xchg bx, bx
    ; mov byte [0xb8000], 'P'

    jmp prepare_protected_mode
    
; bochs中显示结果
;     xchg bx, bx
; 
;     mov cx, [ards_count]
;     mov si, 0
; .show:
;     mov eax, [si + ards_buffer]
;     mov ebx, [si + ards_buffer + 8]
;     mov edx, [si + ards_buffer + 16]
;     add si, 20
;     xchg bx, bx
;     loop .show
; 
; jmp $

prepare_protected_mode:
    ; xchg bx, bx 
    cli ; 关中断

    ; 打开A20线
    in al, 0x92
    or al, 0b10
    out 0x92, al

    lgdt [gdt_ptr] ;加载 gdt

    ; 启动保护模式
    mov eax, cr0
    or eax, 1
    mov cr0, eax

    ; 用跳转来刷新缓存，应用保护模式
    ; double word
    jmp dword code_selector:protect_mode



;------------------保护模式和全局描述符------------

;----------------打印----------------
; 进入实模式后不能调用（不能用bios系统调用了）
print:
    mov ah, 0x0e
.next:
    mov al, [si]
    cmp al, 0
    jz .done
    int 0x10
    inc si
    jmp .next
.done:
    ret

loading:
    db "Loading Onix...", 10, 13, 0

detecting:
    db "Detect memory success...", 10, 13, 0

read_msg:
    db "Read disk success...", 10, 13, 0

error:
    mov si, .msg
    call print
    hlt ; CPU停止
    jmp $
    .msg db "Loading error...", 10, 13, 0

[bits 32]
protect_mode:
    ; xchg bx, bx
    ; 初始化段寄存器
    mov ax, data_selector
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax
    ; 修改栈顶
    ; 操作系统留在上方，栈向下增长互不影响
    mov esp, 0x10000 ; 修改栈顶

    ; 读内核
    mov edi, 0x10000 ; 读取目标内存
    mov ecx, 10 ;起始扇区
    mov bl, 200 ;扇区数量
    call read_disk

    jmp dword code_selector:0x10000

    ud2 ; 如果执行表明发生错误

;-------------读硬盘-----------
read_disk:
    ;设置读写扇区数量
    mov dx, 0x1f2
    mov al, bl
    out dx, al 

    inc dx ;0x1f3
    mov al, cl ;起始扇区前8位
    out dx, al

    inc dx ;0x1f4
    shr ecx, 8
    mov al, cl ;起始扇区中8位
    out dx, al

    inc dx ;0x1f5
    shr ecx, 8
    mov al, cl ;起始扇区高8位
    out dx, al

    inc dx ;0x1f6 0-3起始扇区24-27位，4：0主盘，1从片；
    shr ecx, 8
    and cl, 0b1111 ;高四位置0
    
    mov al, 0b1110_0000
    or al, cl
    out dx, al ;主盘 lba模式

    inc dx ;0x1f7
    mov al, 0x20 ;读硬盘
    out dx, al

    xor ecx, ecx;
    mov cl, bl ;得到读写扇区数量

    .read:
        push cx ;保存cx
        call .waits ;等待数据准备完毕
        call .reads
        pop cx  ;恢复cx
        loop .read  ;读取一个扇区

    ret

    .waits:
        mov dx, 0x1f7
        .check:
            in al, dx
            jmp $+2
            jmp $+2
            jmp $+2
            and al, 0b1000_1000
            cmp al, 0b0000_1000 ;数据准备完毕
            jnz .check
        ret

    .reads:
        mov dx, 0x1f0
        mov cx, 256 ;一个扇区256字
        .readw:
            in ax, dx
            jmp $+2
            jmp $+2
            jmp $+2
            mov [edi], ax
            add edi, 2
            loop .readw
        ret

;------------全局描述符相关-------------
; 段选择子
code_selector equ (1 << 3)
data_selector equ (2 << 3)

memory_base equ 0 ; 内存开始位置：基地址
memory_limit equ ((1024 * 1024 * 1024 * 4) / (1024 * 4)) - 1 ; 内存界限 4G/4k-1

gdt_ptr:
    dw (gdt_end - gdt_base) - 1
    dd gdt_base
gdt_base:
    dd 0, 0 ; NULL 描述符
gdt_code: ; 代码段
    dw memory_limit & 0xffff ; 段界限 0-15
    dw memory_base & 0xffff ; 基地址 0-15
    db (memory_base >> 16) & 0xff ; 基地址 16-23
    ; 内存- dpl - 代码数据/系统 - 代码/数据 - 非依从 - 可读 - 没有被访问过
    db 0b_1_00_1_1_0_1_0 
    ; 4k - 32 位 - 不是 64 位 - 段界限 16 ~ 19
    ; DEBUG
    db 0b1_1_0_0_0000 | (memory_limit >> 16) & 0xf
    db (memory_base >> 24) & 0xff ; 基地址 24 ~ 31 位
gdt_data: ; 数据段
    dw memory_limit & 0xffff; 段界限 0 ~ 15 位
    dw memory_base & 0xffff; 基地址 0 ~ 15 位
    db (memory_base >> 16) & 0xff; 基地址 16 ~ 23 位
    ; 内存- dpl - 代码数据/系统 - 代码/数据 - 非依从 - 可读 - 没有被访问过
    db 0b_1_00_1_0_0_1_0;
    ; 4k - 32 位 - 不是 64 位 - 段界限 16 ~ 19
    db 0b1_1_0_0_0000 | (memory_limit >> 16) & 0xf
    db (memory_base >> 24) & 0xff; 基地址 24 ~ 31 位
gdt_end:

;------------内存检查数据结构---------------
ards_count:
    dd 0
; 不知道有多少个，防止覆盖后续内容，放到最后
ards_buffer:
