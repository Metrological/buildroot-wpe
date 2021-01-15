################################################################################
#
# wpeframework-netflix
#
################################################################################

WPEFRAMEWORK_NETFLIX_VERSION = f6a8e08b05853ef9185c160dc9564ee98c33b6aa
ifeq ($(BR2_PACKAGE_NETFLIX5),y)
# Netflix 5 has a little different API, use "netflix5" branch for now.
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DNETFLIX_VERSION_5=true
WPEFRAMEWORK_NETFLIX_DEPENDENCIES = wpeframework netflix5
ifeq ($(BR2_PACKAGE_NETFLIX5_1),y)
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DNETFLIX_VERSION_5_1=true
endif
else
ifeq ($(BR2_PACKAGE_NETFLIX52),y)
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DNETFLIX_VERSION_5_2=true
WPEFRAMEWORK_NETFLIX_DEPENDENCIES = wpeframework netflix52
else
WPEFRAMEWORK_NETFLIX_DEPENDENCIES = wpeframework netflix
endif
endif

WPEFRAMEWORK_NETFLIX_SITE_METHOD = git
WPEFRAMEWORK_NETFLIX_SITE = git@github.com:WebPlatformForEmbedded/WPEPluginNetflix.git
WPEFRAMEWORK_NETFLIX_INSTALL_STAGING = YES

# wpeframework-netflix binary package config
WPEFRAMEWORK_NETFLIX_OPKG_NAME = "wpeframework-netflix"
WPEFRAMEWORK_NETFLIX_OPKG_VERSION = "1.0.0"
WPEFRAMEWORK_NETFLIX_OPKG_ARCHITECTURE = "${BR2_ARCH}"
WPEFRAMEWORK_NETFLIX_OPKG_MAINTAINER = "Metrological"
WPEFRAMEWORK_NETFLIX_OPKG_DESCRIPTION = "WPEFramework Netflix plugin"

WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DBUILD_REFERENCE=${WPEFRAMEWORK_NETFLIX_VERSION}

# TODO: Do not have WPEFRAMEWORK versioning yet
# WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_NETFLIX_VERSION="$(WEBBRIDGE_BUILD_VERSION)-dev"

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_PLUGIN_NETFLIX_AUTOSTART),y)
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_NETFLIX_AUTOSTART=true
else
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_NETFLIX_AUTOSTART=false
endif

ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_PLUGIN_NETFLIX_MODEL),"")
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_NETFLIX_MODEL="$(call qstrip,$(BR2_PACKAGE_WPEFRAMEWORK_PLUGIN_NETFLIX_MODEL))"
endif

ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_PLUGIN_NETFLIX_FRIENDLY_NAME),"")
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_NETFLIX_FRIENDLY_NAME="$(call qstrip,$(BR2_PACKAGE_WPEFRAMEWORK_PLUGIN_NETFLIX_FRIENDLY_NAME))"
endif

ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_PLUGIN_NETFLIX_SUSPEND_TIMEOUT),"")
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_NETFLIX_SUSPENDTIMEOUT="$(call qstrip,$(BR2_PACKAGE_WPEFRAMEWORK_PLUGIN_NETFLIX_SUSPEND_TIMEOUT))"
endif

ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_PLUGIN_NETFLIX_RESUME_TIMEOUT),"")
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_NETFLIX_RESUMETIMEOUT="$(call qstrip,$(BR2_PACKAGE_WPEFRAMEWORK_PLUGIN_NETFLIX_RESUME_TIMEOUT))"
endif

ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_PLUGIN_NETFLIX_VERSION_POSTFIX),"")
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_DEV_POSTFIX="$(call qstrip,$(BR2_PACKAGE_WPEFRAMEWORK_PLUGIN_NETFLIX_VERSION_POSTFIX))"
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_PLUGIN_NETFLIX_FULLHD),y)
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_NETFLIX_FULLHD=true
else
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_NETFLIX_FULLHD=false
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_PLUGIN_NETFLIX_HIGHRESUI),y)
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_NETFLIX_HIGHRESUI=true
else
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_NETFLIX_HIGHRESUI=false
endif

ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_PLUGIN_NETFLIX_KEY_REPEAT_DELAY),"")
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_NETFLIX_KEYREPEATDELAY="$(call qstrip,$(BR2_PACKAGE_WPEFRAMEWORK_PLUGIN_NETFLIX_KEY_REPEAT_DELAY))"
endif

ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_PLUGIN_NETFLIX_APPBOOTKEY),"")
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_NETFLIX_APPBOOTKEY="$(call qstrip,$(BR2_PACKAGE_WPEFRAMEWORK_PLUGIN_NETFLIX_APPBOOTKEY))"
endif

ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_PLUGIN_NETFLIX_DEVICE_KEYS),"")
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_NETFLIX_DEVICE_KEYS="$(call qstrip,$(BR2_PACKAGE_WPEFRAMEWORK_PLUGIN_NETFLIX_DEVICE_KEYS))"
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_PLUGIN_NETFLIX_AVC_HIGH),y)
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_NETFLIX_AVC_HIGH=ON
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_PLUGIN_NETFLIX_HDR10),y)
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_NETFLIX_HDR10=ON
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_PLUGIN_NETFLIX_DOLBY_VISION),y)
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_NETFLIX_DOLBY_VISION=ON
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_PLUGIN_NETFLIX_HEVC),y)
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_NETFLIX_HEVC=ON
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_PLUGIN_NETFLIX_VP9_P0),y)
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_NETFLIX_VP9_PROFILE_0=ON
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_PLUGIN_NETFLIX_VP9_P2),y)
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_NETFLIX_VP9_PROFILE_2=ON
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_PLUGIN_NETFLIX_VP9_HDR),y)
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_NETFLIX_VP9_HDR=ON
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_PLUGIN_NETFLIX_DDP2),y)
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_NETFLIX_DDP2=ON
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_PLUGIN_NETFLIX_DDP5_1),y)
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_NETFLIX_DDP5_1=ON
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_PLUGIN_NETFLIX_DOLBY_ATMOS),y)
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_NETFLIX_DOLBY_ATMOS=ON
endif

ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_PLUGIN_NETFLIX_DEFAULT_LAUGUAGE),"")
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_NETFLIX_LAUGUAGE=$(call qstrip,$(BR2_PACKAGE_WPEFRAMEWORK_PLUGIN_NETFLIX_DEFAULT_LAUGUAGE))
endif

ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_PLUGIN_NETFLIX_VIDEO_BUFFER_SIZE),"")
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_NETFLIX_VIDEO_BUFFER_SIZE=$(call qstrip,$(BR2_PACKAGE_WPEFRAMEWORK_PLUGIN_NETFLIX_VIDEO_BUFFER_SIZE))
endif

ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_PLUGIN_NETFLIX_AUDIO_BUFFER_SIZE),"")
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_NETFLIX_AUDIO_BUFFER_SIZE=$(call qstrip,$(BR2_PACKAGE_WPEFRAMEWORK_PLUGIN_NETFLIX_AUDIO_BUFFER_SIZE))
endif

ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_PLUGIN_NETFLIX_DISK_CACHE_SIZE),"")
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_NETFLIX_DISK_CACHE_SIZE=$(call qstrip,$(BR2_PACKAGE_WPEFRAMEWORK_PLUGIN_NETFLIX_DISK_CACHE_SIZE))
endif

ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_PLUGIN_NETFLIX_SURFACE_CACHE_SIZE),"")
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_NETFLIX_SURFACE_CACHE_SIZE=$(call qstrip,$(BR2_PACKAGE_WPEFRAMEWORK_PLUGIN_NETFLIX_SURFACE_CACHE_SIZE))
endif

ifeq  ($(BR2_PACKAGE_RPI_FIRMWARE),y)
ifeq ($(BR2_PACKAGE_NETFLIX5),y)
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_SPLASH_IMAGE_FORMAT=PNG
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_ENABLE_AUDIO_DOWNMIX=true
endif
ifeq ($(BR2_PACKAGE_NETFLIX52),y)
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_SPLASH_IMAGE_FORMAT=PNG
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_ENABLE_AUDIO_DOWNMIX=true
endif
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_CREATE_IPKG_TARGETS),y)

WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DWPEFRAMEWORK_CREATE_IPKG_TARGETS=ON

$(call SIMPLE_OPKG_TOOLS_CREATE_CPACK_METADATA,WPEFRAMEWORK_NETFLIX)
WPEFRAMEWORK_NETFLIX_CONF_OPTS += ${WPEFRAMEWORK_NETFLIX_OPKG_CPACK_METADATA}

WPEFRAMEWORK_NETFLIX_POST_BUILD_HOOKS += SIMPLE_OPKG_TOOLS_MAKE_PACKAGE

define WPEFRAMEWORK_NETFLIX_INSTALL_TARGET_CMDS
	@# install package
	$(call SIMPLE_OPKG_TOOLS_INSTALL_PACKAGE,\
	${@D}/${WPEFRAMEWORK_NETFLIX_OPKG_NAME}_${WPEFRAMEWORK_NETFLIX_OPKG_VERSION}_${WPEFRAMEWORK_NETFLIX_OPKG_ARCHITECTURE}.deb)
endef # WPEFRAMEWORK_NETFLIX_INSTALL_TARGET_CMDS

endif # ($(BR2_PACKAGE_WPEFRAMEWORK_CREATE_IPKG_TARGETS),y)

$(eval $(cmake-package))

