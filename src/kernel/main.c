#include "onix/debug.h"
#include "onix/types.h"
#include "onix/task.h"

extern void console_init();
extern void gdt_init();
extern void interrupt_init();

extern void memory_init();
extern void memory_map_init();
extern void mapping_init();
extern void task_init();
extern void hang();

void kernel_init() {

    interrupt_init();

    // 外中断测试
    // asm volatile( "sti\n");  // 开中断

    // task_init();

    memory_map_init();
    mapping_init();

    // BMB;
    // char *ptr = (char*)(0x100000 * 20);
    // ptr[0] = 'a';
    memory_test();


    hang();

    return;
}
