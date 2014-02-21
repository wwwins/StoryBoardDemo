# project name
PROJECT_NAME=StoryBoardDemo

# provisioning profile
PROVISIONING=Provisioning-Profile

# workspace
WORKSPACE=

# project
PROJECT=$(PROJECT_NAME).xcodeproj

# archives path, default is ~/archives/
ARCHIVES_PATH=~/archives/$(PROJECT_NAME).xcarchive/

# ipa path
IPA_PATH=~/Desktop/$(PROJECT_NAME).ipa

# base path
BASE_PATH=

ifdef WORKSPACE
CC_FLAG = -workspace $(WORKSPACE)
else
CC_FLAG = -project $(PROJECT)
endif

CC=xctool
BUILD=xcodebuild


all: bump clean archive ipa

build:
	$(CC) $(CC_FLAG) -scheme $(PROJECT_NAME) build

archive:
	$(CC) $(CC_FLAG) -scheme $(PROJECT_NAME) archive -archivePath "$(ARCHIVES_PATH)"
	
ipa:
	$(BUILD) -exportArchive -exportFormat ipa -archivePath "$(ARCHIVES_PATH)" -exportPath "$(IPA_PATH)" -exportProvisioningProfile "$(PROVISIONING)"

bump:
	bump.sh $BASE_PATH$(PROJECT_NAME)/$(PROJECT_NAME)-Info.plist

clean:
	$(CC) $(CC_FLAG) -scheme $(PROJECT_NAME) clean	
	rm -rf $(ARCHIVES_PATH)
