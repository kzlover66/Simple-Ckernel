#!/bin/bash
# a simple script to compile this
nasm -f bin boot.asm -o boot.bin || exit 1

gcc -ffreestanding -fno-pie -m16 -c kernel.c -o kernel.o || exit 1
ld -m elf_i386 -Ttext 0x7E00 --oformat binary -nostdlib -o kernel.bin kernel.o || exit 1

KERNEL_SIZE=$(stat -c%s kernel.bin)
if [ $KERNEL_SIZE -gt 1024 ]; then
    echo "too big:("
    exit 1
fi

dd if=/dev/zero of=os_image.bin bs=512 count=2880 || exit 1
dd if=boot.bin of=os_image.bin conv=notrunc || exit 1
dd if=kernel.bin of=os_image.bin bs=512 seek=1 conv=notrunc || exit 1

echo "Compilação concluída. Execute com:"
echo "qemu-system-i386 -fda os_image.bin"
