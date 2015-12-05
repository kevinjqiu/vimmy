DOT_VIMRC_FULLPATH := $(HOME)/.nvimrc
DOT_VIM_FULLPATH := $(HOME)/.nvim

bootstrap: $(DOT_VIM_FULLPATH)/bundle/neobundle.vim
	git clone https://github.com/Shougo/neobundle.vim "$(DOT_VIM_FULLPATH)/bundle/neobundle.vim"

link: $(DOT_VIMRC_FULLPATH) $(DOT_VIM_FULLPATH)

$(DOT_VIMRC_FULLPATH):
	ln --symbolic $(shell pwd)/nvimrc $(DOT_VIMRC_FULLPATH)

$(DOT_VIM_FULLPATH):
	ln --symbolic $(shell pwd)/nvim $(DOT_VIM_FULLPATH)
