# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=AstraL-Kernel
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=mondrian
device.name2=
device.name3=
device.name4=
device.name5=
supported.versions=11.0-14.0
supported.patchlevels=
'; } # end properties

# shell variables
is_slot_device=1; # Enable slot device handling for A/B devices
ramdisk_compression=auto;

# Set the appropriate block device based on the active slot
block=/dev/block/bootdevice/by-name/boot; # Adjust if needed for vendor_boot

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;

## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;

## AnyKernel boot install
dump_boot;
write_boot;
## end boot install
