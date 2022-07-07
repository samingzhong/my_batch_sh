#!/bin/bash

############################## 公司机器
# xcode setting
pull_xcode_setting() {
	~/Library/Developer/Xcode/UserData/.syn_tools/git_pull
}

# Android Studio
pull_android_studio_setting(){
	cd ~/Library/Application\ Support/Google/AndroidStudio2021.2/.syn_tools
	./git_pull
}


main(){
	pull_xcode_setting
	pull_android_studio_setting
}


main