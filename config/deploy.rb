# frozen_string_literal: true

require 'mina/rails'
require 'mina/git'
require 'mina/rvm'

set :application_name, 'study_buddy'
set :domain, ENV['MINA_SETTING_DOMAIN']
set :user, ENV['MINA_SETTING_USER']
set :deploy_to, '/var/www/study_buddy'
set :repository, 'https://github.com/kkrasilov/study_buddy.git'
set :branch, 'develop'

set :shared_dirs, fetch(:shared_dirs, []).push(
  'storage',
  'public'
)

set :shared_files, fetch(:shared_files, []).push(
  'config/database.yml',
  'config/credentials.yml.enc',
  'config/master.key',
  '.env'
)

task :remote_environment do
  invoke :'rvm:use', 'ruby-3.2.2@default'
end

desc 'Deploys the current version to the server.'
task :deploy do
  deploy do
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    on :launch do
      in_path(fetch(:current_path)) do
        command %(mkdir -p tmp/)
        command %(touch tmp/restart.txt)
      end
    end
  end
end
