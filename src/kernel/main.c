#include "onix/debug.h"

extern void memory_map_init();
extern void mapping_init();
extern void hang();

void kernel_init() {

    // console_init();
    // kernel_init();
    memory_map_init();
    mapping_init();

    hang();

    return;
}
