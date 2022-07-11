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


# batch_sh 批量同步命令（给crontab用）
push_batch_sh(){
	cd ~/.my_batch_sh
	git add *
	git commit -m "更新batch_sh脚本内容"
	echo "git push..."
	git push
}



main(){
	push_batch_sh
	push_xcode_setting
	push_android_studio_setting
}


main