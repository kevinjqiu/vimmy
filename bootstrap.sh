#! /usr/bin/env sh

# TODO allow customized ENDPATH via cmdarg
ENDPATH="$HOME/vimmy"
REPO_URL="http://github.com/kevinjqiu/vimmy.git"

TODAY=`date +%Y%m%d`

for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc; do
    [ -e $i ] && mv $i $i.$TODAY
done

git clone --recursive $REPO_URL $ENDPATH
mkdir -p $ENDPATH/.vim/bundle
ln -s $ENDPATH/vimrc $HOME/.vimrc
ln -s $ENDPATH/vim $HOME/.vim

git clone http://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle

vim +BundleInstall! +BundleClean +q
