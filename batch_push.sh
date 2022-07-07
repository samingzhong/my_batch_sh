#!/bin/bash

############################## 公司机器
# xcode setting
push_xcode_setting() {
	~/Library/Developer/Xcode/UserData/.syn_tools/git_push
}

# Android Studio
push_android_studio_setting(){
	cd ~/Library/Application\ Support/Google/AndroidStudio2021.2/.syn_tools
	./git_push
}


main(){
	push_xcode_setting
	push_android_studio_setting
}


main