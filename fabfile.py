import os
import commands
import json
from os.path import abspath
from os.path import exists
from os.path import join as pjoin
from os.path import isdir
from fabric.colors import red
from fabric.colors import yellow
# from fabric.context_managers import lcd
# from fabric.api import local

ALL = ('ALL', 'all', '*')
PATHOGEN_URL = "https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim"

BUNDLE_DIR = abspath('vim/bundle')
ENABLED_DIR = abspath('vim/enabled')
CURRENT_DIR = abspath('.')
MANIFEST = abspath('manifest.json')

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

def get_plugins_from_dir(dir_name):
    plugins = os.listdir(dir_name)
    retval = []
    for plugin in plugins:
        dirname = pjoin(dir_name, plugin)
        if isdir(dirname):
            if exists(pjoin(dirname, '.git')):
                os.chdir(pjoin(dirname, '.git'))
                output = commands.getoutput('git config -l | grep remote.origin.url')
                _, url = output.split('=')
                os.chdir(CURRENT_DIR)
            retval.append(dict(name=plugin, url=url))

    return retval

def list(filter='all'):
    def _display(plugins):
        for plugin in plugins:
            info(plugin)

    if filter in ALL:
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

def install(plugin_spec):
    """Install the plugin, update the manifest if update_manifest is True"""
    if plugin_spec.startswith('git://') or plugin_spec.startswith('https://'):
        plugin_name = plugin_spec.split('/')[-1].split('.git')[0]
        os.chdir(BUNDLE_DIR)
        os.system('git clone %s' % plugin_spec)
        os.chdir(CURRENT_DIR)
        enable(plugin_name)

def manifest():
    """Update the manifest file"""
    plugins = get_plugins_from_dir(ENABLED_DIR)
    with open(MANIFEST, 'w') as f:
        json.dump(plugins, f)
    info('%s is updated' % MANIFEST)

def manifest_install(manifest_file=MANIFEST):
    with open(MANIFEST, 'r') as f:
        plugins = json.load(f)
        for plugin in plugins:
            info("Installing %s..." % plugin['name'])
            install(plugin['url'])

def helptags():
    """Build help tags"""
    os.system('vim +"helptags %s" +qall' % ENABLED_DIR)
