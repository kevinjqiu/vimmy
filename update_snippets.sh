#! /usr/bin/env sh
[ ! -e snipmate-snippets ] && git clone http://github.com/kevinjqiu/snipmate-snippets
cd snipmate-snippets && rake deploy_local
