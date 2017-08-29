WPEFRAMEWORK_PROVISIONING_VERSION = 34ee6eadc34aae55db2dde318cadd37ce6497a8e
WPEFRAMEWORK_PROVISIONING_SITE_METHOD = git
WPEFRAMEWORK_PROVISIONING_SITE = git@github.com:WebPlatformForEmbedded/WPEPluginProvisioning.git
WPEFRAMEWORK_PROVISIONING_INSTALL_STAGING = YES
WPEFRAMEWORK_PROVISIONING_DEPENDENCIES = wpeframework libprovision

WPEFRAMEWORK_PROVISIONING_CONF_OPTS += -DBUILD_REFERENCE=${WPEFRAMEWORK_PROVISIONING_VERSION}

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_DEBUG),y)
# TODO: This recently stopped working, for now pass debug flags explicitly.
#WPEFRAMEWORK_PROVISIONING_CONF_OPTS += -DCMAKE_BUILD_TYPE=Debug
WPEFRAMEWORK_PROVISIONING_CONF_OPTS += -DCMAKE_CXX_FLAGS='-g -Og'
endif

$(eval $(cmake-package))
