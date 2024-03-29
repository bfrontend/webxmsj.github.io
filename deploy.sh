#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# 生成静态文件
path=$(pwd)
echo "$path"
# npm run build

# 进入生成的文件夹
cd docs/.vuepress/dist

# deploy to github pages
echo 'www.bfrontend.com' > CNAME

if [ -z "$GITHUB_TOKEN" ]; then
  msg='deploy'
  githubUrl=git@github.com:webxmsj/webxmsj.github.io.git
else
  msg='来自github actions的自动部署'
  githubUrl=https://webxmsj:${GITHUB_TOKEN}@github.com/webxmsj/webxmsj.github.io.git
  git config --global user.name "webxmsj"
  git config --global user.email "heartdream1994@gmail.com"
fi
git init
git add -A
git commit -m "${msg}"
git push -f $githubUrl master:gh-pages # 推送到github gh-pages分支

# deploy to coding pages
# echo 'bfrontend.com' > CNAME  # 自定义域名
# if [ -z "$CODING_TOKEN" ]; then
#   codingMsg='deploy'
#   codingUrl=git@e.coding.net:webxmsj-01/webxmsj-blog/webxmsj.git
# else
#   codingMsg='来自github actions的自动部署'
#   codingUrl=https://zXeMBYHXuv:${CODING_TOKEN}@e.coding.net/webxmsj-01/webxmsj-blog/webxmsj.git
# fi
# git init
# git add -A
# git commit -m "${codingMsg}"
# git push -f $codingUrl master:master

cd -
# rm -rf docs/.vuepress/dist
