#include "onix/debug.h"
#include "onix/types.h"
#include "onix/task.h"

extern void console_init();
extern void gdt_init();
extern void interrupt_init();

extern void memory_map_init();
extern void mapping_init();
extern void task_init();
extern void hang();

void kernel_init() {

    console_init();
    gdt_init();
    interrupt_init();

    // 外中断测试
    // asm volatile( "sti\n");  // 开中断

    // u32 counter = 0;
    // while (1)
    // {
    //     DEBUGK("looping in kernel init...\n", counter++);
    //     delay(100000);
    // }
    // memory_map_init();
    // mapping_init();

    // hang();

    task_init();

    return;
}
