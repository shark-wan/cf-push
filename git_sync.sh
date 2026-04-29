#!/bin/bash
# git_sync.sh
# 功能：将当前目录下的 ip.txt 文件强制推送到 GitHub 仓库的 main 分支
# 使用场景：配合 Cloudflare IP 优选工具，自动同步优选结果到远程仓库
#
# 凭据通过 git credential store 管理，token 不会明文写入脚本

# ==================== 切换到脚本所在目录 ====================
cd "$(dirname "$0")" || exit 1

# ==================== 拉取远程最新更新 ====================
git pull origin main || true

# ==================== 暂存并提交 ip.txt ====================
git add ip.txt
commit_msg="Update ip.txt on $(date '+%Y-%m-%d %H:%M:%S')"
git commit -m "$commit_msg"

# ==================== 强制推送到 GitHub ====================
git push "https://github.com/shark-wan/cf-push.git" main --force

echo "✅ ip.txt 已推送到 GitHub"
