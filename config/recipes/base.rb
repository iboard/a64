# @param [String] from - the erb-template to read from
# @param [String] to - where to put the rendered result
def template(from, to=nil,template_path=nil)
  template_path ||= File.expand_path("../templates",__FILE__)
  _template = File.join(template_path, from)
  erb = File.read(_template)
  result = ERB.new(erb).result(binding)
  if to
    put result, to  
  else
    result
  end
end


namespace :deploy do

  desc "Install your server"
  task :install do
    puts "NO INSTALL RECIPIENT IS DEFINED YET"
    puts "SEE #{__FILE__} :deploy:install AND SETUP REQIRED STEPS THERE"
    puts "Or use project 'deploy' to setup base packages"
  end

  desc "Setup the config-files on the server with example-defaults"
  task :setup_config, roles: :app do
    run "mkdir -p #{shared_path}/config"
    run "mkdir -p #{shared_path}/config/settings"
    run "mkdir -p #{shared_path}/../releases"
    run "mkdir -p #{shared_path}/pids"
    run "mkdir -p #{shared_path}/log"
  end
  after "deploy:setup", "deploy:setup_config"

  desc "Create shared path for CKEditor"
  task :create_shared_path_for_ckeditor do
    run "mkdir -p #{shared_path}/ckeditor_assets"
  end
  after "deploy:setup", "deploy:create_shared_path_for_ckeditor"

  desc "Symlink config-files after update"
  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/mongoid.yml #{release_path}/config/mongoid.yml"
    run "ln -nfs #{shared_path}/config/secrets.yml #{release_path}/config/secrets.yml"
    run "ln -nfs #{shared_path}/config/settings.yml #{release_path}/config/settings.yml"
    run "ln -nfs #{shared_path}/config/settings #{release_path}/config/settings"
  end
  after "deploy:finalize_update", "deploy:symlink_config"

  desc "Symlink CKEditor-assets"
  task :symlink_ckeditor_asset_path do
    run "ln -nfs #{shared_path}/ckeditor_assets #{release_path}/public/"
  end
  after "deploy:finalize_update", "deploy:symlink_ckeditor_asset_path"

  [:start, :stop, :restart].each do |t|
    desc "#{t} task is a no-op with proxy_balancer"
    task t, :roles => :app do
      #noop
    end
  end
  
end