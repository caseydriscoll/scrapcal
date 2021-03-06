# config valid only for current version of Capistrano
lock "3.8.1"

set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.3.0'

set :application, "scrapcal.com"
set :repo_url, "ssh://git/casey/scrapcal.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, ".env.staging", "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
append :linked_dirs, "public/system", "public/uploads"
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do
  desc 'Says a message when deployment is completed'
  task :say do
    system("\\say Capistrano Deployment Completed! Good Job!")
  end
end

after "deploy:finished", 'deploy:say'

namespace :deploy do
  desc 'Reset and populate the database with users after migrate'
  task :populate do
    on roles(:all), in: :sequence do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'db:reset'
          execute :rake, 'db:populate'
          execute "rm -rf /opt/scrapcal.com/staging/current/public/uploads/*"
          execute "mkdir -p /opt/scrapcal.com/staging/current/public/uploads/proof/image"
        end
      end
    end
  end
end

after "deploy:migrate", 'deploy:populate'

namespace :deploy do
  after :restart, :restart_passenger do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      within release_path do
        execute :touch, 'tmp/restart.txt'
      end
    end
  end
  after :finishing, 'deploy:restart_passenger'
end

