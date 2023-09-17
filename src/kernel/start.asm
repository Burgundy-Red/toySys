[bits 32]

extern kernel_init
extern console_init
extern memory_init
extern gdt_init

global _start
_start:
    ; memory init参数
    push ebx; ards_count address
    push eax; magic

    call console_init; 控制台初始化
    call gdt_init
    call memory_init; 内存初始化
    call kernel_init

    jmp $; 阻塞
