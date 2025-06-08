; bootloader for our little C kernel
; Kzlover66
; Feel free to use this code and learn more about operating systems
; <3

bits 16 ; Bootloader code normally runs on 16 bits ASM, but the "bits 16" is optional
org 0x7c00 ; org for bootloader address

start:
  ; segmentation configs
  xor ax, ax
  mov ds, ax
  mov es, ax
  mov ss, ax
  mov sp, 0x7c00

  ; load kernel with 2 sectors
  mov ah, 0x02 ; BIOS call to read sector
  mov al, 2 ; 2 sectors
  mov ch, 0 ; C 0
  mov dh, 0 ; C1 0
  mov cl, 2 ; Sector 2(bootloader runs on sector 1)
  mov bx, 0x7E00 ; kernel address
  int 0x13 ; interruption

  jc disk_err ; jmp if any error
  mov ax, 0x0003
  int 0x10

  jmp 0x0000:0x7E00 ; jmp to kernel

disk_err:
  jmp $ ; halt

times 510-($-$$) db 0x0
dw 0xAA55

; bootloaders are not really user-friendly, so its kinda hard understand that
