require 'bundler/capistrano'

server '178.63.96.144', :app, :web, :db, primary: true

set :user, 'fedbrand'
set :deploy_to, '/var/rails/fedbrand'

set :use_sudo, false
set :deploy_via, :remote_cache

set :scm, :git
set :repository, 'git@github.com:RavWar/FedBrand.git'
set :normalize_asset_timestamps, false
set :shared_children, shared_children + %w[public/uploads]

ssh_options[:forward_agent] = true

namespace :deploy do
  namespace :assets do
    task :precompile, :roles => :web, :except => { :no_release => true } do
      from = source.next_revision(current_revision)
      if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
        run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
      else
        logger.info "Skipping asset pre-compilation because there were no asset changes"
      end
    end
  end
end

namespace :deploy do
  task(:start) {}
  task(:stop)  {}

  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end
end