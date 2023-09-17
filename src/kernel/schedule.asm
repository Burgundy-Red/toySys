[bits 32]

section .text

global task_switch
task_switch:
    push ebp
    mov ebp, esp

    ; 被调用者保存
    push ebx
    push esi
    push edi

    mov eax, esp
    and eax, 0xfffff000 ; current 
    
    mov [eax], esp ; 保存a栈指针
    
    mov eax, [ebp + 8]
    mov esp, [eax] ; 切换到任务b

    pop edi
    pop esi
    pop ebx ; 恢复任务b寄存器的值

    pop ebp ; 恢复栈帧

    ret ; 相当于 pop eip，继续执行任务b
