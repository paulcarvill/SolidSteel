# config valid only for current version of Capistrano
lock '3.3.5'

set :application, 'solidsteel'
set :repo_url, 'git@github.com:paulcarvill/solidsteel.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/rails'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

#set :rvm_ruby_version, '2.2.0-preview1@solidsteel'      # Defaults to: 'default'




## set :rvm_ruby_string, "2.2.0"
## set :bundle_cmd, 'source $HOME/.bash_profile && bundle'
set :bundle_path, -> { '/usr/local/rvm/gems/ruby-2.2.0-preview1' }  # default: nil
#set :bundle_flags, '--deployment --quiet'                       # this is default
## set :bundle_cmd, "/usr/local/rvm/gems/ruby-2.2.0-preview1/bin/bundle"
## set :bundle_dir, "/usr/local/rvm/gems/ruby-2.2.0-preview1"


namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
