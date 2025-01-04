# frozen_string_literal: true

require 'mina/rails'
require 'mina/git'
require 'mina/rvm'

set :application_name, 'study_buddy'
set :domain, '82.97.253.42'
set :user, 'deploy'
set :deploy_to, '/var/www/study_buddy'
set :repository, 'https://github.com/kkrasilov/study_buddy.git'
set :branch, 'add-vite'

set :shared_dirs, fetch(:shared_dirs, []).push(
  'storage'
)

set :shared_files, fetch(:shared_files, []).push(
  'config/database.yml',
  'config/credentials.yml.enc',
  'config/master.key',
  '.env'
)

task :remote_environment do
  invoke :'rvm:use', 'ruby-3.2.2@default'
  invoke :'nvm:load'
end

task :setup do
  invoke :'nvm'
end

desc 'Deploys the current version to the server.'
task :deploy do
  deploy do
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'nvm:install'
    invoke :'rails:db_migrate'
    command %(yarn install --ignore-engines)
    command %(RAILS_ENV=production bin/vite clobber)
    command %(RAILS_ENV=production bin/vite build)
    invoke :'deploy:cleanup'

    on :launch do
      in_path(fetch(:current_path)) do
        command %(mkdir -p tmp/)
        command %(touch tmp/restart.txt)
      end
    end
  end
end

task :nvm do
  command 'echo "-----> Installing Node Version Manager"'
  command 'curl -s https://raw.github.com/creationix/nvm/master/install.sh | sh'
  invoke :'nvm:load'
end

task :bundle do
  command 'bundle install'
end

namespace :nvm do
  task :load do
    command 'echo "-----> Loading nvm"'
    command %{
      source ~/.nvm/nvm.sh
    }
    command 'echo "-----> Now using nvm v.`nvm --version`"'
  end

  task :install do
    command %{
      echo "-----> Install node v.#{'16'}"
      nvm install #{'16'}
      ln -s ${NVM_BIN} ./.bin
    }
  end
end
