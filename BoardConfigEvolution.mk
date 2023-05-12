#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Kernel
BOARD_KERNEL_IMAGE_NAME := Image.lz4
TARGET_KERNEL_CONFIG := cloudripper_gki_defconfig
TARGET_KERNEL_SOURCE := kernel/google/gs201/private/gs-google
TARGET_NEEDS_DTBOIMAGE := true

# *** Uses prebuilt kernel for now. ***
TARGET_KERNEL_DIR := device/google/lynx-kernel
TARGET_FORCE_PREBUILT_KERNEL := true
TARGET_PREBUILT_KERNEL := $(TARGET_KERNEL_DIR)/Image.lz4
PRODUCT_COPY_FILES += \
    $(TARGET_PREBUILT_KERNEL):kernel

# Kernel modules
BOARD_VENDOR_KERNEL_MODULES_BLOCKLIST_FILE := device/google/gs201/vendor_dlkm.modules.blocklist
TARGET_KERNEL_EXT_MODULE_ROOT := kernel/google/gs201/private/google-modules

# Manifests
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += vendor/evolution/config/device_framework_matrix.xml
DEVICE_MANIFEST_FILE += \
    device/google/gs201/android.hardware.security.rkp-service.citadel.xml \
    device/google/gs201/manifest_radio_ds.xml

# Partitions
AB_OTA_PARTITIONS += \
    vendor \
    vendor_dlkm

BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm

# Enable chain partition for vendor.
BOARD_AVB_VBMETA_VENDOR := vendor
BOARD_AVB_VBMETA_VENDOR_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_VENDOR_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX_LOCATION := 3

AB_OTA_PARTITIONS += \
    vbmeta_vendor

# Verified Boot
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
