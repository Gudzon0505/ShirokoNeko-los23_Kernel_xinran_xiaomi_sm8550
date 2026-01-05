
# AnyKernel3 Payload для Poco F6 Pro (vermeer)
# Автор сборки: Гудзон0505
# Цель: LineageOS 23 (Android 16) + SuKiSu Ultra + SUSFS v2.0

properties() { '
kernel.string=ShiroNeko Kernel for Poco F6 Pro (vermeer)
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=vermeer
device.name2=Poco F6 Pro
device.name3=23113RKC6G
device.name4=23113RKC6C
supported.versions=14, 15, 16
supported.patchlevels=
'; }

# Атрибуты загрузочных файлов
boot_attributes() {
set_perm_recursive 0 0 755 644 $RAMDISK/*;
set_perm_recursive 0 0 750 750 $RAMDISK/init* $RAMDISK/sbin;
}

## Настройка разделов
# Для Snapdragon 8 Gen 2 на Android 16 ядро находится в /boot
BLOCK=/dev/block/by-name/boot;
IS_SLOT_DEVICE=1; # Устройство использует слоты A/B
RAMDISK_COMPRESSION=auto;
PATCH_VBMETA_FLAG=auto;

# Импорт функций
. tools/ak3-core.sh;

## Установка ядра
dump_boot; # Распаковка текущего boot

# Запись нового ядра
write_boot;
## Конец установки
