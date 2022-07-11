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

# batch_sh 批量同步命令（给crontab用）
pull_batch_sh(){
	cd ~/.my_batch_sh
	echo "git stash push..."
	git add *
	git stash push
	echo "git pull..."
	git pull
	echo "git stash pop..."
	git stash pop
}


# 同步脚本（调用各repo用）


main(){
	pull_batch_sh
	pull_xcode_setting
	pull_android_studio_setting
}


main