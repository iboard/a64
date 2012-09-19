namespace :coverage do

  desc "run tests with coverage"
  task :cover do
    `rspec --no-drb spec/spec_helper.rb spec/**/*_spec.rb`
  end

end