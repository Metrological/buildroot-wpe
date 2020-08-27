################################################################################
#
# wpebackend-rdk
#
################################################################################

WPEBACKEND_RDK_VERSION = 3ec8dfd1a1f1cede256fd5de0a63a8c6b6a31ffa
WPEBACKEND_RDK_SITE = $(call github,WebPlatformForEmbedded,WPEBackend-rdk,$(WPEBACKEND_RDK_VERSION))
WPEBACKEND_RDK_INSTALL_STAGING = YES
WPEBACKEND_RDK_DEPENDENCIES = libwpe libglib2 libinput

ifeq ($(BR2_PACKAGE_LIBXKBCOMMON),y)
WPEBACKEND_RDK_DEPENDENCIES += libxkbcommon
endif

WPEBACKEND_RDK_FLAGS =

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_COMPOSITORCLIENT), y)

WPEBACKEND_RDK_DEPENDENCIES += wpeframework
WPEBACKEND_RDK_FLAGS = -DUSE_BACKEND_WPEFRAMEWORK=ON -DUSE_INPUT_LIBINPUT=OFF -DUSE_HOLE_PUNCH_GSTREAMER=OFF

else

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_VIRTUALINPUT),y)
WPEBACKEND_RDK_DEPENDENCIES += wpeframework
WPEBACKEND_RDK_FLAGS += -DUSE_VIRTUAL_KEYBOARD=ON
endif

WPEBACKEND_RDK_DEPENDENCIES += libegl
WPEBACKEND_RDK_FLAGS += -DUSE_BACKEND_BCM_RPI=ON

endif

WPEBACKEND_RDK_CONF_OPTS += $(WPEBACKEND_RDK_FLAGS)

$(eval $(cmake-package))
