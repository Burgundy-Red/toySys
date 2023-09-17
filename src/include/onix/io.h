#ifndef ONIX_IO_H
#define ONIX_IO_H

#include "onix/types.h"

u8 inb(u16 port);  // 输入一个字节
u16 inw(u16 port); // 输入一个字
u32 inl(u16 port); // 输入一个双字

void outb(u16 port, u8 value);  // 输出一个字节
void outw(u16 port, u16 value); // 输出一个字
void outl(u16 port, u32 value); // 输出一个双字

#endif
