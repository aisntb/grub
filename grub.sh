#!/bin/bash

WORKDIR="/home/hisnty/dev/grub-test"
ISO_PATH="$WORKDIR.iso"

echo "==> ISO 재생성 중..."
grub-mkrescue -o "$ISO_PATH" "$WORKDIR" || {
  echo "ISO 생성 실패!"
  exit 1
}

echo "==> QEMU로 부팅 시작..."
qemu-system-x86_64 \
  -cdrom "$ISO_PATH" \
  -m 512 -smp 2 -enable-kvm -cpu host \
  -display gtk \
  -vga std
