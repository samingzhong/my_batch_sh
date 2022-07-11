#!/bin/bash
echo "running script $0..."


############################## 公司机器 ##############################
push_xcode_setting=~/Library/Developer/Xcode/UserData
push_android_studio_setting=~/Library/Application\ Support/Google/AndroidStudio2021.2
my_batch_sh=~/.my_batch_sh
my_syn_tools=~/.my_syn_tools
my_opr_log_dir=~/work/my_opr_log
git_push=~/.my_syn_tools/.syn_tools/git_push
software_backup=~/code/others/backup_software

# 项目代码本地目录
kafu=~/work/kafu
logger_plugin=~/work/logger_plugin


# exit 0


push_my_setting () {
	$git_push "$my_batch_sh"
	$git_push "$my_syn_tools"
	$git_push "$push_xcode_setting"
	$git_push "$push_android_studio_setting"
}

push_current_branch_to_remote (){
	echo "running script $0, $1..."
	# exit 0

	targetDir=$1
	log_name=$(echo "$targetDir"|sed 's/\//_/g')
	echo "⏫⏫⏫⏫⏫⏫⏫⏫ push 操作 start at [$targetDir] ⏫⏫⏫⏫⏫⏫⏫⏫" >> "$my_opr_log_dir/${log_name}.log" 2>&1
	cd "$targetDir" >> "$my_opr_log_dir/${log_name}.log" 2>&1
	git add .
	git commit -m "临时commit，请忽略...（Generated By Script）" >> "$my_opr_log_dir/${log_name}.log" 2>&1
	current_branch=$(git branch --show-current)
	result=$(echo $current_branch|grep "_zxm")
	if [[ -z "$result" ]]; then
		tmp_branch=${current_branch}_zxm
		echo "没有匹配到_zxm结尾的分支,即将创建并切换到分支:$tmp_branch..." >> "$my_opr_log_dir/${log_name}.log" 2>&1
		git branch -C $tmp_branch
		git checkout $tmp_branch
	else
		echo "匹配到当前分支为_zxm结尾的分支" >> "$my_opr_log_dir/${log_name}.log" 2>&1
	fi
	
	echo "git branch --unset-upstream..." >> "$my_opr_log_dir/${log_name}.log" 2>&1
	git branch --unset-upstream >> "$my_opr_log_dir/${log_name}.log" 2>&1
	echo "设置对应的远程分支git push --set-upstream origin "$tmp_branch" ..." >> "$my_opr_log_dir/${log_name}.log" 2>&1
	git push --set-upstream origin "$tmp_branch" >> "$my_opr_log_dir/${log_name}.log" 2>&1

	echo "⏫⏫⏫⏫⏫⏫⏫⏫ push 操作 end at [$targetDir] ⏫⏫⏫⏫⏫⏫⏫⏫"  >> "$my_opr_log_dir/${log_name}.log" 2>&1
}

push_my_working_repo_to_my_develop_branch () {
	push_current_branch_to_remote "$kafu"
	push_current_branch_to_remote "$logger_plugin"

	push_my_opr_log_dir
}

push_my_opr_log_dir () {
	cd "$my_opr_log_dir"
	git add .
	git commit -m "同步log.（Generated By Script）"
	current_branch=$(git branch --show-current)
	git push --set-upstream origin "$current_branch" 
}

main(){

# 推送当前开发分支到远端
	push_my_working_repo_to_my_develop_branch

# 推送配置类、工具类代码
	push_my_setting

}

main
