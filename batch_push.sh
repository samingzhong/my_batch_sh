#!/bin/bash
echo "running script $0..."


############################## 公司机器
push_xcode_setting=~/Library/Developer/Xcode/UserData
push_android_studio_setting=~/Library/Application\ Support/Google/AndroidStudio2021.2
my_batch_sh=~/.my_batch_sh
my_syn_tools=~/.my_syn_tools

main(){
	~/.my_syn_tools/.syn_tools/git_push "$my_batch_sh"
	~/.my_syn_tools/.syn_tools/git_push "$my_syn_tools"
	~/.my_syn_tools/.syn_tools/git_push "$push_xcode_setting"
	~/.my_syn_tools/.syn_tools/git_push "$push_android_studio_setting"
}


main