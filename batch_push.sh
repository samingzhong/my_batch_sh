#!/bin/bash

echo "running script $0..."


############################## 公司机器
# xcode setting

push_xcode_setting=~/Library/Developer/Xcode/UserData
push_android_studio_setting=~/Library/Application\ Support/Google/AndroidStudio2021.2
batch_sh=~/.my_batch_sh

# push_xcode_setting() {
# 	~/Library/Developer/Xcode/UserData/.syn_tools/git_push
# }

# # Android Studio
# push_android_studio_setting(){
# 	cd ~/Library/Application\ Support/Google/AndroidStudio2021.2/.syn_tools
# 	./git_push
# }


# # batch_sh 批量同步命令（给crontab用）
# push_batch_sh(){
# 	cd ~/.my_batch_sh
# 	git add *
# 	git rm $(git ls-files --deleted)
# 	git commit -m "更新batch_sh脚本内容"
# 	echo "git push..."
# 	git push
# }



main(){

	~/.my_syn_tools/.syn_tools/git_push "$batch_sh"
	~/.my_syn_tools/.syn_tools/git_push "$push_xcode_setting"
	~/.my_syn_tools/.syn_tools/git_push "$push_android_studio_setting"
}


main