#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# 生成静态文件
npm run build

# 进入生成的文件夹
cd docs/.vuepress/dist

# deploy to github
# echo 'blog.orxing.top' > CNAME
# if [ -z "$GITHUB_TOKEN" ]; then
#   msg='deploy'
#   githubUrl=git@github.com:ourongxing/ohmyblog.git
# else
#   msg='来自github actions的自动部署'
#   githubUrl=https://ourongxing:${GITHUB_TOKEN}@github.com/ourongxing/ohmyblog.git
#   git config --global user.name "ourongxing"
#   git config --global user.email "orongxing@gmail.com"
# fi
#
# git init
# git add -A
# git commit -m "${msg}"
# git push -f $githubUrl master:gh-pages # 推送到github

# deploy to coding
# echo 'www.xugaoyi.com\nxugaoyi.com' > CNAME  # 自定义域名
if [ -z "$ALI_TOKEN" ]; then  # -z 字符串 长度为0则为true；$CODING_TOKEN来自于github仓库`Settings/Secrets`设置的私密环境变量
  aliUrl=git@47.100.27.13:/var/repo/ohmyblog.git
else
  aliUrl=https://git:${ALI_TOKEN}@47.100.27.13:/var/repo/ohmyblog.git
fi
git add -A
git commit -m "${msg}"
git push -f $aliUrl master # 推送到coding

cd - # 退回开始所在目录
rm -rf docs/.vuepress/dist
