PATHOGEN_URL = "https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim"

PATHS = {
  :autoload  => File.expand_path('vim/autoload'),
  :pathogen  => File.expand_path('vim/autoload/pathogen.vim'),
  :vim       => File.expand_path('vim'),
  :vimrc     => File.expand_path('vimrc'),
  :bundle    => File.expand_path('vim/bundle'),
  :enabled   => File.expand_path('vim/enabled'),
  :current   => File.expand_path('.'),
  :manifest  => File.expand_path('manifest.yaml'),
  :dot_vim   => File.expand_path('~/.vim'),
  :dot_vimrc => File.expand_path('~/.vimrc')
}

POST_INSTALL_HOOKS = {}

def post_install(plugin_name, &exec)
  POST_INSTALL_HOOKS[plugin_name] = exec
end

post_install "pyflakes" do
  `sudo pip install pyflakes`
end

post_install "tagbar" do
  `sudo pip install python-ctags`
  `sudo apt-get install exuberant-ctags`
end

post_install "ropevim" do
  `sudo pip install ropevim`
end

BLACKLIST = ['.', '..', '_local', 'KEEPME']

def _bool(val)
  if !!val == val
    return val
  else
    ['true', 'yes', '1'].include? val.downcase
  end
end

def _invoke_rake_task(task_name, *a)
  Rake::Task[task_name].reenable
  Rake::Task[task_name].invoke *a
end

def _git_clone(repo)
  system("env GIT_SSL_NO_VERIFY=true git clone #{repo}")
end

def _plugins(dir_name)
  plugins = []
  Dir.foreach(dir_name) do |plugin_dir|
    plugin_full_path = File.join(dir_name, plugin_dir)
    if (File.directory? plugin_full_path) || (File.symlink? plugin_full_path)
      unless BLACKLIST.include? plugin_dir
        plugin = {:name => plugin_dir}
        Dir.chdir("#{dir_name}/#{plugin_dir}") do
          if File.exists? '.git'
            _, url = *`git config -l | grep remote.origin.url`.split('=')
            plugin[:url] = url
          end
        end
        plugins.push(plugin)
      end
    end
  end
  plugins
end

desc "List plugins.

:param: filter either :all or :enabled
:param: detailed if True, print the detail so fthe plugin, or just the plugin name"
task :list, :filter, :detailed do |t, args|
  args.with_defaults(
    :filter   => :all,
    :detailed => false
  )

  path = (args[:filter].to_sym == :all && PATHS[:bundle]) || PATHS[:enabled]
  _plugins(path).each do |plugin|
    if _bool(args[:detailed])
      puts "#{plugin[:name]}\t#{plugin[:url]}"
    else
      puts "#{plugin[:name]}"
    end
  end
end

desc "Install pathogen."
task :pathogen do
  unless File.exists? PATHS[:autoload]
    system "mkdir -p #{PATHS[:autoload]}"
  end
  if system "curl -k -so #{PATHS[:pathogen]} #{PATHOGEN_URL}"
    puts "Pathogen is updated."
  end
end

desc "Enable plugin."
task :enable, :plugin_name do |t, args|
  plugin_enabled_path = File.join(PATHS[:enabled], args[:plugin_name])
  plugin_install_path = File.join(PATHS[:bundle], args[:plugin_name])
  if File.exists? plugin_enabled_path
    puts "#{args[:plugin_name]} is already enabled."
  end
  if not (File.exists? plugin_install_path)
    puts "#{args[:plugin_name]} is not installed."
  end

  File.symlink plugin_install_path, plugin_enabled_path
  puts "Enabled #{args[:plugin_name]}."
end

desc "Disable plugin."
task :disable, :plugin_name do |t, args|
  plugin_enabled_path = File.join(PATHS[:enabled], args[:plugin_name])
  File.unlink plugin_enabled_path
  puts "Disabled #{args[:plugin_name]}."
end

desc "Install plugin."
task :install, :plugin_spec do |t, args|
  if /^(git|https):\/\//.match args[:plugin_spec]
    plugin_name = args[:plugin_spec].split('/')[-1].split('.git')[0]
    Dir.chdir(PATHS[:bundle]) do
      if _git_clone(args[:plugin_spec])
        puts "#{plugin_name} was installed."
        _invoke_rake_task "enable", plugin_name
        post_install = POST_INSTALL_HOOKS[plugin_name]
        if post_install
          puts 'Triggering post-install hook...'
          post_install.call
        end
      else
        puts "#{plugin_name} was not installed correctly."
      end
    end
  else
    puts "Non-git plugins not supported yet."
  end
end

desc "Install plugins from manifest.yaml"
task :manifest_install do
  require 'yaml'
  YAML.load(File.new(PATHS[:manifest])).each do |plugin|
    puts "Installing #{plugin['name']}..."
    _invoke_rake_task "install", plugin['url']
  end
end

desc "Symlinks"
task :symlinks do
  require 'fileutils'

  if File.exists? PATHS[:dot_vim]
    FileUtils.mv PATHS[:dot_vim], File.expand_path('~/.vim')
    puts "Backup #{PATHS[:dot_vim]} to ~/.vim.bak"
  end

  if File.exists? PATHS[:dot_vimrc]
    FileUtils.mv PATHS[:dot_vimrc], File.expand_path('~/.vimrc.bak')
    puts "Backup #{PATHS[:dot_vimrc]} to ~/.vimrc.bak"
  end

  File.symlink PATHS[:vimrc], PATHS[:dot_vimrc]
  puts "Symlinked #{PATHS[:vimrc]} to #{PATHS[:dot_vimrc]}"
  File.symlink PATHS[:vim], PATHS[:dot_vim]
  puts "Symlinked #{PATHS[:vim]} to #{PATHS[:dot_vim]}"
end

desc "Build helptags"
task :helptags do
  Dir.foreach(PATHS[:enabled]) do |plugin_name|
    unless BLACKLIST.include? plugin_name
      puts "Building helptags for #{plugin_name}..."
      path = File.join(PATHS[:enabled], plugin_name)
      system "vim +\"helptags #{path}\" +qall"
    end
  end
end

desc "Bootstrap my vim environment."
task :bootstrap => [:pathogen, :manifest_install, :symlinks, :helptags] do
  _invoke_rake_task "enable", "_local"
end
