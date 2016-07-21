################################################################################
#
# gluelogic
#
################################################################################

GLUELOGIC_VERSION = 5d29bc028c2a1169e877115808f3fee128a55a7c
GLUELOGIC_SITE_METHOD = git
GLUELOGIC_SITE = git@github.com:Metrological/gluelogic.git
GLUELOGIC_INSTALL_STAGING = YES
GLUELOGIC_DEPENDENCIES = cppsdk

ifeq ($(BR2_ENABLE_DEBUG),y)
GLUELOGIC_CONF_OPTS += \
	-DCMAKE_C_FLAGS_DEBUG="-O0 -g" \
	-DCMAKE_CXX_FLAGS_DEBUG="-O0 -g"
else
GLUELOGIC_CONF_OPTS += \
	-DCMAKE_C_FLAGS_RELEASE="-DNDEBUG" \
	-DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG"
endif

ifeq ($(BR2_ENABLE_DEBUG),y)
GLUELOGIC_CONF_OPTS += -DGLUELOGIC_DEBUG=ON
else ifeq ($(BR2_PACKAGE_CPPSDK_DEBUG),y)
GLUELOGIC_CONF_OPTS += -DGLUELOGIC_DEBUG=ON
endif

ifeq ($(BR2_PACKAGE_GLUELOGIC_QUEUEPLAYER),y)
GLUELOGIC_CONF_OPTS += -DGLUELOGIC_QUEUEPLAYER=ON
endif

ifeq ($(BR2_PACKAGE_GLUELOGIC_VIRTUAL_KEYBOARD),y)
GLUELOGIC_CONF_OPTS += -DGLUELOGIC_VIRTUAL_KEYBOARD=ON
endif

ifeq ($(BR2_PACKAGE_GLUELOGIC_KEYBOARDSCANNER),y)
GLUELOGIC_CONF_OPTS += -DGLUELOGIC_KEYBOARDSCANNER=ON
endif

ifeq ($(BR2_PACKAGE_GLUELOGIC_TESTAPPS),y)
GLUELOGIC_CONF_OPTS += -DGLUELOGIC_TESTAPPS=ON
endif

ifeq ($(BR2_PACKAGE_GLUELOGIC_TEST_KEYBOARDSINK),y)
GLUELOGIC_CONF_OPTS += -DGLUELOGIC_TEST_KEYBOARDSINK=ON
endif

ifeq ($(BR2_PACKAGE_GLUELOGIC_TEST_KEYBOARDSOURCE),y)
GLUELOGIC_CONF_OPTS += -DGLUELOGIC_TEST_KEYBOARDSOURCE=ON
endif

ifeq ($(BR2_PACKAGE_GLUELOGIC_TEST_QUEUEPLAYERSTUB),y)
GLUELOGIC_CONF_OPTS += -DGLUELOGIC_TEST_QUEUEPLAYERSTUB=ON
endif

ifeq ($(BR2_PACKAGE_GLUELOGIC_VIRTUAL_KEYBOARD_TOOLS),y)
GLUELOGIC_CONF_OPTS += -DGLUELOGIC_VIRTUALKEYBOARD_TOOLS=ON
endif

$(eval $(cmake-package))
