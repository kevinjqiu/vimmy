import os
import commands
import json
from os.path import abspath as _abspath
from os.path import exists as _exists
from os.path import join as _pjoin
from os.path import isdir as _isdir
from fabric.colors import red as _red
from fabric.colors import yellow as _yellow
# from fabric.context_managers import lcd
# from fabric.api import local

ALL = ('ALL', 'all', '*')
PATHOGEN_URL = "https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim"

VIM_DIR = _abspath('vim')
VIMRC = _abspath('vimrc')
BUNDLE_DIR = _abspath('vim/bundle')
ENABLED_DIR = _abspath('vim/enabled')
AUTOLOAD_DIR = _abspath('vim/autoload')
CURRENT_DIR = _abspath('.')
MANIFEST = _abspath('manifest.json')

DOT_VIM_DIR = _abspath(os.path.expanduser('~/.vim'))
DOT_VIMRC = _abspath(os.path.expanduser('~/.vimrc'))

def _info(text):
    print(text)

def _warn(text):
    print(_yellow(text))

def _err(text):
    print(_red(text))

def _get_plugins_from_dir(dir_name):
    plugins = os.listdir(dir_name)
    retval = []
    for plugin in plugins:
        dirname = _pjoin(dir_name, plugin)
        if _isdir(dirname):
            if _exists(_pjoin(dirname, '.git')):
                os.chdir(_pjoin(dirname, '.git'))
                output = commands.getoutput('git config -l | grep remote.origin.url')
                _, url = output.split('=')
                os.chdir(CURRENT_DIR)
                retval.append(dict(name=plugin, url=url))

    return retval

def _asbool(val):
    if isinstance(val, bool):
        return val

    if val.lower() in ('true', 'yes', '1'):
        return True
    elif val.lower() in ('false', 'no', '0'):
        return False
    else:
        raise TypeError('val must be true/false/1/0')

def pathogen():
    """Fetch the latest pathogen script and install it under ~/.vim/autoload"""
    if not _exists(AUTOLOAD_DIR):
        os.mkdir(AUTOLOAD_DIR)
    os.system('curl -so %s %s 2>/dev/null' % (_pjoin(AUTOLOAD_DIR, 'pathogen.vim'), PATHOGEN_URL))
    _info("Pathogen is updated.")

def list(filter='all', detailed=False):
    """List the plugins

    :param: filter can be 'all' or 'enabled'
    :param: detailed if True, print the details of the plugin,
                     or just the plugin name if False
    """
    def _display(plugins):
        for plugin in plugins:
            if _asbool(detailed):
                _info(plugin)
            else:
                _info(plugin['name'])

    if filter in ALL:
        _display(_get_plugins_from_dir(BUNDLE_DIR))
    elif filter == 'enabled':
        _display(_get_plugins_from_dir(ENABLED_DIR))
    else:
        _err("filter is one of ('all', 'enabled')")

def enable(plugin_name):
    """Enable the plugin by symlinking it to the enabled/ directory"""
    if _exists(_pjoin(ENABLED_DIR, plugin_name)):
        _info('%s is already enabled.' % plugin_name)
        return
    if not _exists(_pjoin(BUNDLE_DIR, plugin_name)):
        _err("%s doesn't exist in your plugin repo. Install it first." % plugin_name)
        return
    os.symlink(_pjoin(BUNDLE_DIR, plugin_name), _pjoin(ENABLED_DIR, plugin_name))

def disable(plugin_name):
    """Disable the plugin by removing the symlink from enabled/ directory"""
    if not _exists(_pjoin(ENABLED_DIR, plugin_name)):
        _info('%s is not enabled.' % plugin_name)
        return
    os.unlink(_pjoin(ENABLED_DIR, plugin_name))

def install(plugin_spec):
    """Install the plugin, update the manifest if update_manifest is True"""
    if plugin_spec.startswith('git://') or plugin_spec.startswith('https://'):
        plugin_name = plugin_spec.split('/')[-1].split('.git')[0]
        os.chdir(BUNDLE_DIR)
        os.system('env GIT_SSL_NO_VERIFY=true git clone %s' % plugin_spec)
        os.chdir(CURRENT_DIR)
        enable(plugin_name)

def manifest():
    """Update the manifest file"""
    plugins = _get_plugins_from_dir(ENABLED_DIR)
    with open(MANIFEST, 'w') as f:
        json.dump(plugins, f, indent=4)
    _info('%s is updated' % MANIFEST)

def manifest_install(manifest_file=MANIFEST):
    """Bulk install plugins from manifest file"""
    with open(MANIFEST, 'r') as f:
        plugins = json.load(f)
        for plugin in plugins:
            _info("Installing %s..." % plugin['name'])
            install(plugin['url'])

def helptags():
    """Build help tags"""
    os.system('vim +"helptags %s" +qall' % ENABLED_DIR)

def bootstrap():
    """Bootstrap a vimmy system"""
    os.symlink(VIM_DIR, DOT_VIM_DIR)
    _info('%s linked to %s' % (VIM_DIR, DOT_VIM_DIR))
    os.symlink(VIMRC, DOT_VIMRC)
    _info('%s linked to %s' % (VIMRC, DOT_VIMRC))
    pathogen()
    manifest_install()
    enable('_local')
