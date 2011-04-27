Build Instruction
=================

In home directory:
``ln -s `pwd`/vimmy/.vimrc `pwd`/.vimrc``
``ln -s `pwd`/vimmy/.vim `pwd`/.vim``

in the repository root directory (vimmy), execute: `git submodule init && git submodule update`
Launch vim, enter :BundleInstall

Build Command-T
---------------
* Install ruby-dev
* cd $VIM/bundle/Command-T/ruby/command-t
* ruby extconf.rb
* make

Included Plugins
----------------
Take a look [here](https://github.com/kevinjqiu/vimmy/blob/master/.vim/conf/vundle.vim)

TODO
----
* build script

