######################################
#
# gxbottlerocket
#
######################################

GXBOTTLEROCKET_VERSION = 98d41d4437da1d418cda5b88c8698a44379f62d8
GXBOTTLEROCKET_SITE = $(call github,brummer10,GxBottleRocket.lv2,$(GXBOTTLEROCKET_VERSION))
GXBOTTLEROCKET_BUNDLES = gx_bottlerocket.lv2

GXBOTTLEROCKET_TARGET_MAKE = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE)  SSE_CFLAGS="-O3 -mfpu=vfpv3" -C $(@D) 

define GXBOTTLEROCKET_BUILD_CMDS
	$(GXBOTTLEROCKET_TARGET_MAKE) mod
endef

define GXBOTTLEROCKET_INSTALL_TARGET_CMDS
	$(GXBOTTLEROCKET_TARGET_MAKE) install DESTDIR=$(TARGET_DIR) INSTALL_DIR=/usr/lib/lv2
endef

$(eval $(generic-package))
