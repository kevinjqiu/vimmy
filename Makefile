DOT_VIMRC_FULLPATH := $(HOME)/.vimrc
DOT_VIM_FULLPATH := $(HOME)/.vim

bootstrap:
	git clone https://github.com/Shougo/neobundle.vim "$(shell pwd)/vim/bundle/neobundle.vim"

link: $(DOT_VIMRC_FULLPATH) $(DOT_VIM_FULLPATH)

$(DOT_VIMRC_FULLPATH):
	ln --symbolic $(shell pwd)/vimrc $(DOT_VIMRC_FULLPATH)

$(DOT_VIM_FULLPATH):
	ln --symbolic $(shell pwd)/vim $(DOT_VIM_FULLPATH)
