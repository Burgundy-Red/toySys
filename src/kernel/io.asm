[bits 32]

section .text

global inb
inb:
    push ebp
    mov ebp, esp

    xor eax, eax
    mov edx, [ebp + 8] ; 调用call时，会在栈中压入返回地址
    in al, dx ; 端口号dx的 8bit 输入到al
    
    jmp $+2
    jmp $+2
    jmp $+2

    leave
    ret

global inw
inw:
    push ebp
    mov ebp, esp
    
    xor eax, eax
    mov edx, [ebp + 8]
    in ax, dx
    
    jmp $+2
    jmp $+2
    jmp $+2

    leave
    ret

global inl ; 将 inl 导出
inl:
    push ebp; 
    mov ebp, esp ; 保存帧

    xor eax, eax ; 将 eax 清空
    mov edx, [ebp + 8]; port 
    in eax, dx; 将端口号 dx 的 32 bit 输入到 eax

    jmp $+2
    jmp $+2
    jmp $+2

    leave ; 恢复栈帧
    ret

global outb
outb:
    push ebp
    mov ebp, esp
    
    mov edx, [ebp + 8]
    mov eax, [ebp + 12]
    out dx, al

    jmp $+2
    jmp $+2
    jmp $+2

    leave ; 恢复栈帧
    ret

global outw
outw:
    push ebp; 
    mov ebp, esp ; 保存帧

    mov edx, [ebp + 8]; port 
    mov eax, [ebp + 12]; value
    out dx, ax; 将 ax 中的 16 bit 输入出到 端口号 dx

    jmp $+2 ; 一点点延迟
    jmp $+2 ; 一点点延迟
    jmp $+2 ; 一点点延迟

    leave ; 恢复栈帧
    ret

global outl
outl:
    push ebp; 
    mov ebp, esp ; 保存帧

    mov edx, [ebp + 8]; port 
    mov eax, [ebp + 12]; value
    out dx, eax; 将 eax 中的 32 bit 输入出到 端口号 dx

    jmp $+2 ; 一点点延迟
    jmp $+2 ; 一点点延迟
    jmp $+2 ; 一点点延迟

    leave ; 恢复栈帧
    ret
