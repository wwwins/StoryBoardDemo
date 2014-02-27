########################################################################
#
# Makefile for the iOS projects.
# 
# Remember to modify Makefile.cfg.mk configuration.
#
# Usage:
#
# To build ipa:
# $make ipa
#
# To release app:
# $make release
#
# To clean up:
# $make clean
#
# Author: flashisobar
# URL: http://isobar.logdown.com/posts/180478-makefile-for-my-ios-project
#
########################################################################
include Makefile.cfg.mk

ifdef WORKSPACE
CC_FLAG = -workspace $(WORKSPACE)
else
CC_FLAG = -project $(PROJECT)
endif

CC=xctool
BUILD=xcodebuild
RM=/bin/rm


all: clean build archive ipa

release: bump ipa

build:
	$(CC) $(CC_FLAG) -scheme $(PROJECT_NAME) build

archive:
	$(CC) $(CC_FLAG) -scheme $(PROJECT_NAME) archive -archivePath "$(ARCHIVES_PATH)"
	
ipa: clean archive
	$(RM) -rf $(IPA_PATH)
	$(BUILD) -exportArchive -exportFormat ipa -archivePath "$(ARCHIVES_PATH)" -exportPath "$(IPA_PATH)" -exportProvisioningProfile "$(PROVISIONING)"
	@echo
	@echo "Build finished. The ipa file is in the $(ARCHIVES_PATH)."
	
bump:
	bump.sh $(PROJECT_NAME)/$(PROJECT_NAME)-Info.plist

clean:
	$(CC) $(CC_FLAG) -scheme $(PROJECT_NAME) clean	
	$(RM) -rf $(ARCHIVES_PATH)
