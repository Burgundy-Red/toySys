[bits 32]

extern console_init
extern gdt_init
extern memory_init
extern kernel_init

global _start
_start:
    ; memory init参数
    push ebx; ards_count address
    push eax; magic

    call console_init; 控制台初始化
    call gdt_init
    call memory_init; 内存初始化

    ; jmp $; 阻塞

    call kernel_init
    ; xchg bx, bx    
    ; 异常测试
    ; int 0x80; 未设置，0x0D control protection

    ; mov bx, 0 ; 0x00 divide by zero
    ; div bx
    

    jmp $
