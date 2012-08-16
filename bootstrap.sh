#! /usr/bin/env sh

ENDPATH="$HOME/vimmy"
REPO_URL="http://github.com/kevinjqiu/vimmy.git"

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

TODAY=`date +%Y%m%d`

for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc; do
    [ -e $i ] && mv $i $i.$TODAY
done

git clone --recursive -b vundle $REPO_URL $ENDPATH
mkdir -p $ENDPATH/.vim/bundle
ln -s $ENDPATH/vimrc $HOME/.vimrc
ln -s $ENDPATH/vim $HOME/.vim

git clone http://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle

vim +BundleInstall! +BundleClean +q
