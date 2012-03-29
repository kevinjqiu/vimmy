func! vimmy#load_plugin_conf(plugin_conf_dir)
    for plugin_file in split(globpath(a:plugin_conf_dir, "*.vim"))
        exec "source " plugin_file
    endfor
endf
