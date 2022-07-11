#!/bin/bash
echo "running script $0..."


############################## 公司机器 ##############################
push_xcode_setting=~/Library/Developer/Xcode/UserData
push_android_studio_setting=~/Library/Application\ Support/Google/AndroidStudio2021.2
my_batch_sh=~/.my_batch_sh
my_syn_tools=~/.my_syn_tools
my_opr_log_dir=~/work/my_opr_log


# 项目代码本地目录
kafu=~/work/kafu


# exit 0


push_my_setting {
	~/.my_syn_tools/.syn_tools/git_push "$my_batch_sh"
	~/.my_syn_tools/.syn_tools/git_push "$my_syn_tools"
	~/.my_syn_tools/.syn_tools/git_push "$push_xcode_setting"
	~/.my_syn_tools/.syn_tools/git_push "$push_android_studio_setting"
}

push_current_branch_to_remote (){
	echo "running script $0..."
	exit 0

	targetDir=$2
	log_name=$(echo "$targetDir"|sed 's/\//_/g')
	echo "⏫⏫⏫⏫⏫⏫⏫⏫ push 操作 start at [$targetDir] ⏫⏫⏫⏫⏫⏫⏫⏫" >> "$my_opr_log_dir/${log_name}.log" 2>&1
	cd "$targetDir" >> "$my_opr_log_dir/${log_name}.log" 2>&1
	git add . >> "$my_opr_log_dir/${log_name}.log" 2>&1
	current_branch=$(git branch --show-current)
	git push --set-upstream origin "$current_branch"  >> "$my_opr_log_dir/${log_name}.log" >> "$my_opr_log_dir/${log_name}.log" 2>&1

	echo "⏫⏫⏫⏫⏫⏫⏫⏫ push 操作 end at [$targetDir] ⏫⏫⏫⏫⏫⏫⏫⏫" >> "$my_opr_log_dir/${log_name}.log" 2>&1
}

push_my_working_repo_to_my_develop_branch () {
	push_current_branch_to_remote "$kafu"
}

main(){

	echo "sdfsaf"
	exit 0

# 推送配置类、工具类代码
	# push_my_setting

# 推送当前开发分支到远端
	push_my_working_repo_to_my_develop_branch

}


echo "hello ==============="
main