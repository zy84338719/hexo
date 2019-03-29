#!/bin/zsh
export PATH=$HOME/bin:/usr/local/node/bin:/usr/local/bin:$PATH
echo $PATH
cd /opt/tools/hexo/
echo "本次执行时间"
date
echo "开始执行"
yuque-hexo clean
echo "语雀缓存清除完成"
yuque-hexo sync
echo "同步语雀完成"
hexo clean
echo "博客缓存清除完成"
hexo deploy
echo "上传完毕"
