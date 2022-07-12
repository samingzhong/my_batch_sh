#!/bin/bash
echo "running script $0..."


############################## 公司机器（可以通过IP或者机器名称做判断，暂不支持）
# 对应GitHub仓库
# 同步工具链
push_xcode_setting=~/Library/Developer/Xcode/UserData
push_android_studio_setting=~/Library/Application\ Support/Google/AndroidStudio2021.2
my_batch_sh=~/.my_batch_sh
my_syn_tools=~/.my_syn_tools
software_backup=~/code/others/backup_software


main(){
	~/.my_syn_tools/.syn_tools/git_pull "$my_batch_sh"
	~/.my_syn_tools/.syn_tools/git_pull "$my_syn_tools"
	~/.my_syn_tools/.syn_tools/git_pull "$push_xcode_setting"
	~/.my_syn_tools/.syn_tools/git_pull "$push_android_studio_setting"
	~/.my_syn_tools/.syn_tools/git_pull "$software_backup"
}

main 