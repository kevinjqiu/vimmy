Build Instruction
=================

In home directory:
```bash
ln -s `pwd`/vimmy/vimrc `pwd`/.vimrc
```

```bash
ln -s `pwd`/vimmy/vim `pwd`/.vim
```

in the repository root directory (vimmy), execute: `git submodule init && git submodule update`
Launch vim, enter :BundleInstall

Install ctags
-------------
```bash
sudo easy_install python-ctags
```

```sudo apt-get install exuberant-ctags
```

Included Plugins
----------------
Take a look [here](https://github.com/kevinjqiu/vimmy/blob/master/.vim/conf/vundle.vim)

Needs Install
-------------
* pyflakes.vim
* rope/ropemode/ropevim
* exuberant-ctags

TODO
----
* build script

