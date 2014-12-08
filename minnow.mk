# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


# Ramdisk files
PRODUCT_COPY_FILES += \
device/moto/minnow/recovery_ramdisk/etc/recovery.fstab:root/etc/recovery.fstab \
device/moto/minnow/recovery_ramdisk/etc/twrp.fstab:root/etc/twrp.fstab \
device/moto/minnow/recovery_ramdisk/firmware/image/atmxt-r2.tdat:root/firmware/image/atmxt-r2.tdat \
device/moto/minnow/recovery_ramdisk/firmware/image/atmxt-r3.tdat:root/firmware/image/atmxt-r3.tdat \
device/moto/minnow/recovery_ramdisk/fstab.minnow:root/fstab.minnow \
device/moto/minnow/recovery_ramdisk/init:root/init \
device/moto/minnow/recovery_ramdisk/init.mmi.boot.sh:root/init.mmi.boot.sh \
device/moto/minnow/recovery_ramdisk/init.rc:root/init.rc \
device/moto/minnow/recovery_ramdisk/ueventd.minnow.rc:root/ueventd.minnow.rc

