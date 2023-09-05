ifeq ($(THEOS_PACKAGE_SCHEME),rootless)
TARGET=iphone:clang:16.2:15.0
else
TARGET=iphone:clang:14.5:11.0
endif
ARCHS=arm64 arm64e
INSTALL_TARGET_PROCESSES = mobiletimerd SpringBoard

PACKAGE_VERSION=$(THEOS_PACKAGE_BASE_VERSION)

TWEAK_NAME = VolumeFade
$(TWEAK_NAME)_FILES = Tweak.xm
$(TWEAK_NAME)_OBJCFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += alarmfade
include $(THEOS_MAKE_PATH)/aggregate.mk
