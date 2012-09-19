namespace :deploy do

  desc "Create YARD documentation"
  task :create_doc_files, :roles => :web do
    `yard`
    `tar cvzf tmp/doc.tgz doc/`
  end

  desc "Deploy doc to server"
  task :deploy_doc_files, :roles => :web do
    put_file "tmp/doc.tgz", "/tmp/doc.tgz"
    run "tar xvzf /tmp/doc.tgz -C #{release_path}/public/"
  end
  before "deploy:deploy_doc_files", "deploy:create_doc_files"
  after "deploy", "deploy:deploy_doc_files"

  desc "Deploy coverage-output to server"
  task :deploy_coverage, :roles => :web do
    `tar cvzf tmp/coverage.tgz coverage/`
    put_file "tmp/coverage.tgz", "/tmp/coverage.tgz"
    run "tar xvzf /tmp/coverage.tgz -C #{release_path}/public/"
  end
  after "deploy", "deploy:deploy_coverage"

end

