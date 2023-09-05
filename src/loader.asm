[org 0x1000]

dw 0x55aa; 魔术，判断错误

mov si, loading
call print

xchg bx, bx

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
    inc word [ards_count]

    cmp ebx, 0
    jnz .next
    
    mov si, detecting
    call print
    
    xchg bx, bx

    mov cx, [ards_count]
    mov si, 0
.show:
    mov eax, [si + ards_buffer]
    mov ebx, [si + ards_buffer + 8]
    mov edx, [si + ards_buffer + 16]
    add si, 20
    xchg bx, bx
    loop .show

jmp $

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

error:
    mov si, .msg
    call print
    hlt; CPU停止
    jmp $
    .msg db "Loading error...", 10, 13, 0

ards_count:
    dw 0
; 不知道有多少个，防止覆盖后续内容，放到最后
ards_buffer:
