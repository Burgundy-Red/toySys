BUILD:=../build
SRC:=.

ENTRYPOINT:=0x10000

CFLAGS:= -m32
CFLAGS+= -fno-builtin
CFLAGS+= -nostdinc
CFLAGS+= -fno-pic
CFLAGS+= -fno-pie
CFLAGS+= -nostdlib
CFLAGS+= -fno-stack-protector
CFLAGS:=$(strip $(CFLAGS))

DEBUG:= -g
INCLUDE:= -I$(SRC)/include

$(BUILD)/boot/%.bin: $(SRC)/boot/%.asm
	$(shell mkdir -p $(dir $@))
	nasm -f bin $< -o $@

$(BUILD)/kernel/%.o: $(SRC)/kernel/%.asm
	$(shell mkdir -p $(dir $@))
	nasm -f elf32 $< -o $@

$(BUILD)/kernel/%.o: $(SRC)/kernel/%.c
	$(shell mkdir -p $(dir $@))
	gcc -o $@ $(CFLAGS) $(DEBUG) $(INCLUDE) -c $<

$(BUILD)/lib/%.o: $(SRC)/lib/%.c
	$(shell mkdir -p $(dir $@))
	gcc -o $@ $(CFLAGS) $(DEBUG) $(INCLUDE) -c $<

$(BUILD)/kernel.bin: $(BUILD)/kernel/start.o \
    	$(BUILD)/kernel/main.o \
	$(BUILD)/kernel/io.o \
	$(BUILD)/kernel/console.o \
	$(BUILD)/kernel/printk.o \
	$(BUILD)/kernel/assert.o \
	$(BUILD)/kernel/debug.o \
	$(BUILD)/kernel/global.o \
	$(BUILD)/kernel/interrupt.o \
	$(BUILD)/kernel/handler.o \
	$(BUILD)/kernel/schedule.o \
	$(BUILD)/kernel/task.o \
	$(BUILD)/kernel/memory.o \
	$(BUILD)/lib/stdlib.o \
	$(BUILD)/lib/string.o \
	$(BUILD)/lib/vsprintf.o \

	$(shell mkdir -p $(dir $@))
	ld -m elf_i386 -static $^ -o $@ -Ttext $(ENTRYPOINT)

$(BUILD)/system.bin: $(BUILD)/kernel.bin
	objcopy -O binary $< $@

$(BUILD)/system.map: $(BUILD)/kernel.bin
	nm $< | sort > $@

$(BUILD)/master.img: $(BUILD)/boot/boot.bin \
    $(BUILD)/boot/loader.bin \
    $(BUILD)/system.bin \
    $(BUILD)/system.map \

	yes | bximage -q -hd=16 -mode=create -sectsize=512 -imgmode=flat $@
	dd if=$(BUILD)/boot/boot.bin of=$@ bs=512 count=1 conv=notrunc
	dd if=$(BUILD)/boot/loader.bin of=$@ bs=512 count=4 seek=2 conv=notrunc
	dd if=$(BUILD)/system.bin of=$@ bs=512 count=200 seek=10 conv=notrunc

test:	$(BUILD)/master.img

.PHONY: clean
clean:
	rm -rf $(BUILD)

.PHONY: bochs
bochs: $(BUILD)/master.img
	bochs -q
