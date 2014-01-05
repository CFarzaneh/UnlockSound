ARCHS = armv7 armv7s arm64
TARGET = iphone:clang:latest:7.0
THEOS_BUILD_DIR = Packages

include theos/makefiles/common.mk

TWEAK_NAME = UnlockSound
UnlockSound_FILES = UnlockSound.xm
UnlockSound_FRAMEWORKS = UIKit AVFoundation

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 backboardd"
