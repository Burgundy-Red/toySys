[org 0x7c00]

; 设置屏幕模式为文本模式，清除屏幕
mov ax, 3
int 0x10

; 初始化段寄存器
mov ax, 0
mov ds, ax
mov es, ax
mov ss, ax
mov sp, 0x7c00

mov si, booting
call print

xchg bx, bx; 断点

jmp error

; mov edi, 0x1000 ; 读取目标内存
; mov ecx, 0 ;起始扇区
; mov bl, 1 ;扇区数量
; call read_disk
; 
; xchg bx, bx; 断点
; 
; 写入相关
; mov edi, 0x1000 ; 取目标内存
; mov ecx, 2 ;起始扇区
; mov bl, 1 ;扇区数量
; call write_disk
; xchg bx, bx

; 显示
; mov ax, 0xb800
; mov ds, ax
; mov byte [0], 'H'

; 阻塞
jmp $

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

    .read
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

;-------------写硬盘------------
; write_disk:
;     ;设置读写扇区数量
;     mov dx, 0x1f2
;     mov al, bl
;     out dx, al 
; 
;     inc dx ;0x1f3
;     mov al, cl ;起始扇区前8位
;     out dx, al
; 
;     inc dx ;0x1f4
;     shr ecx, 8
;     mov al, cl ;起始扇区中8位
;     out dx, al
; 
;     inc dx ;0x1f5
;     shr ecx, 8
;     mov al, cl ;起始扇区高8位
;     out dx, al
; 
;     inc dx ;0x1f6 0-3起始扇区24-27位，4：0主盘，1从片；
;     shr ecx, 8
;     and cl, 0b1111 ;高四位置0
;     
;     mov al, 0b1110_0000
;     or al, cl
;     out dx, al ;主盘 lba模式
; 
;     inc dx ;0x1f7
;     mov al, 0x30 ;写硬盘
;     out dx, al
; 
;     xor ecx, ecx;
;     mov cl, bl ;得到读写扇区数量
; 
;     .write
;         push cx ;保存cx
;         call .writes
;         call .waits ;等待硬盘繁忙结束
;         pop cx  ;恢复cx
;         loop .write ;写入一个扇区
; 
;     ret
; 
;     .waits:
;         mov dx, 0x1f7
;         .check:
;             in al, dx
;             jmp $+2
;             jmp $+2
;             jmp $+2
;             and al, 0b1000_0000
;             cmp al, 0b0000_0000 ;数据准备完毕
;             jnz .check
;         ret
; 
;     .writes:
;         mov dx, 0x1f0
;         mov cx, 256 ;一个扇区256字
;         .readw:
;             mov ax, [edi]
;             out dx, ax
;             jmp $+2
;             jmp $+2
;             jmp $+2
;             add edi, 2
;             loop .writes
;         ret

;----------------打印------------
print:
    mov ah, 0x0e ;显示字符功能号
.next:
    mov al, [si]
    cmp al, 0
    jz .done
    int 0x10
    inc si
    jmp .next
.done:
    ret 

;--------------定义字符-----------
booting:
    db "Booting Onix...", 10, 13, 0 ;\n\r

error:
    mov si, .msg
    call print
    hlt; CPU停止
    jmp $
    .msg db "Booting error...", 10, 13, 0

; 填充
times 510 - ($ - $$) db 0

; 主引导扇区最后两个字节
db 0x55, 0xaa
