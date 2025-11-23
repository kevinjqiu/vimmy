DOT_VIMRC_FULLPATH := $(HOME)/.vimrc
DOT_VIM_FULLPATH := $(HOME)/.vim

.PHONY: all bootstrap link install clean

all: link bootstrap

bootstrap:
	@echo "Installing vim-plug..."
	@curl -fLo $(HOME)/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@echo "vim-plug installed successfully!"
	@echo "Run 'vim +PlugInstall +qall' to install plugins"

link: $(DOT_VIMRC_FULLPATH) $(DOT_VIM_FULLPATH)

$(DOT_VIMRC_FULLPATH):
	@echo "Creating symlink for vimrc..."
	@ln --symbolic $(shell pwd)/vimrc $(DOT_VIMRC_FULLPATH)

$(DOT_VIM_FULLPATH):
	@echo "Creating symlink for vim directory..."
	@ln --symbolic $(shell pwd)/vim $(DOT_VIM_FULLPATH)

install: link bootstrap
	@echo "Installing plugins..."
	@vim +PlugInstall +qall
	@echo "Setup complete!"

clean:
	@echo "Removing symlinks..."
	@rm -f $(DOT_VIMRC_FULLPATH)
	@rm -f $(DOT_VIM_FULLPATH)
	@echo "Cleaning plugin directories..."
	@rm -rf $(HOME)/.vim/plugged
	@rm -rf $(HOME)/.vim/autoload/plug.vim
	@echo "Clean complete!"
