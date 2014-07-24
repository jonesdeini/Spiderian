require 'bundler/capistrano'
require "rvm/capistrano"

set :rvm_ruby_string, :local

set :application, "Spiderian"
set :deploy_to, "/home/spiderian"

set :scm, :git
set :repository,  "git@github.com:jonesdeini/Spiderian.git"
set :branch, "master"

set :use_sudo, false
set :user, "spiderian"

set :host, "107.170.108.229"
role :web, host
role :app, host

namespace :deploy do
  task :symlink_configs do
    run "cp -R ~/shared/config/* #{current_path}/config/"
  end
end
