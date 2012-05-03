import os
from os.path import abspath
from os.path import exists
from os.path import join as pjoin
from fabric.colors import green
from fabric.colors import red
# from fabric.api import local

PATHOGEN_URL = "https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim"

BUNDLE_DIR = abspath('vim/bundle')
ENABLED_DIR = abspath('vim/enabled')

def info(text):
    print(text)

def warn(text):
    print(yellow(text))

def err(text):
    print(red(text))

def update_pathogen():
    """Fetch the latest pathogen script and install it under ~/.vim/autoload"""
    if not exists(abspath('vim/autoload')):
        os.mkdir('vim/autoload')
    os.system('curl -o vim/autoload/pathogen.vim %s 2>/dev/null' % PATHOGEN_URL)
    info("Pathogen is updated.")

def list(filter='all'):
    def _display(plugins):
        for plugin in plugins:
            info(plugin)

    def get_plugins_from_dir(dir_name):
        plugins = os.listdir(dir_name)
        return [x for x in plugins if x != 'KEEPME']

    if filter == 'all':
        _display(get_plugins_from_dir(BUNDLE_DIR))
    elif filter == 'enabled':
        _display(get_plugins_from_dir(ENABLED_DIR))
    else:
        err("filter is one of ('all', 'enabled')")

def enable(plugin_name):
    """Enable the plugin by symlinking it to the enabled/ directory"""
    if exists(pjoin(ENABLED_DIR, plugin_name)):
        info('%s is already enabled.' % plugin_name)
        return
    if not exists(pjoin(BUNDLE_DIR, plugin_name)):
        red("%s doesn't exist in your plugin repo. Install it first." % plugin_name)
        return
    os.symlink(pjoin(BUNDLE_DIR, plugin_name), pjoin(ENABLED_DIR, plugin_name))

def disable(plugin_name):
    """Disable the plugin by removing the symlink from enabled/ directory"""
    if not exists(pjoin(ENABLED_DIR, plugin_name)):
        info('%s is not enabled.' % plugin_name)
        return
    os.unlink(pjoin(ENABLED_DIR, plugin_name))

def install(plguin_name, update_manifest=True):
    """Install the plugin, update the manifest if update_manifest is True"""
    pass
