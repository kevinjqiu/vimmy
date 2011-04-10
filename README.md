Build Instruction
=================

In home directory:
ln -s `pwd`/vimmy/.vimrc `pwd`/.vimrc
ln -s `pwd`/vimmy/.vim `pwd`/.vim

in the repository root directory (vimmy), execute: `git submodule sync`
Launch vim, enter :BundleInstall

Build Command-T
---------------
* Install ruby-dev
* cd $VIM/bundle/Command-T/ruby/command-t
* ruby extconf.rb
* make
