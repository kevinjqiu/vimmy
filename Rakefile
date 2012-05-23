PATHOGEN_URL = "https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim"

PATHS = {
  :autoload  => File.expand_path('vim/autoload'),
  :pathogen  => File.expand_path('vim/autoload/pathogen.vim'),
  :vim       => File.expand_path('vim'),
  :vimrc     => File.expand_path('vimrc'),
  :bundle    => File.expand_path('vim/bundle'),
  :enabled   => File.expand_path('vim/enabled'),
  :current   => File.expand_path('.'),
  :manifest  => File.expand_path('manifest.json'),
  :snippets  => File.expand_path('vim/bundle/snipMate/snippets'),
  :dot_vim   => File.expand_path('~/.vim'),
  :dot_vimrc => File.expand_path('~/.vimrc')
}

BLACKLIST = ['.', '..', '_local']

def _bool(val)
  ['true', 'yes', '1'].include? val.downcase
end

def _plugins(dir_name)
  plugins = []
  Dir.foreach(dir_name) do |plugin_dir|
    if (File.directory? plugin_dir) && (not BLACKLIST.include? plugin_dir)
      plugin = {:name => plugin_dir}
      Dir.chdir("#{dir_name}/#{plugin_dir}") do
        unless File.exists? '.git'
          _, url = *`git config -l | grep remote.origin.url`.split('=')
          plugin[:url] = url
        end
      end
      plugins.push(plugin)
    end
  end
  plugins
end

desc "List plugins.

:param: filter either 'all' or 'enabled'
:param: detailed if True, print the detail so fthe plugin, or just the plugin name"
task :list, :filter, :detailed do |t, args|
  args.with_defaults(
    :filtered=>"all",
    :detailed=>false
  )

  path = (args[:filter] == 'all' && PATHS[:bundle]) || PATHS[:enabled]
  _plugins(path).each do |plugin|
    if args[:detailed]
      puts "#{plugin[:name]}\t#{plugin[:detailed]}"
    else
      puts "#{plugin[:name]}"
    end
  end
end

desc "Install pathogen."
task :pathogen do
  unless File.exists? PATHS[:autoload]
    system("mkdir -p #{PATHS[:autoload]}")
  end
  if system("curl -so #{PATHS[:pathogen]} #{PATHOGEN_URL}")
    puts "Pathogen is updated."
  end
end
