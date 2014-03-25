# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Blog::Application.load_tasks

task :test do
  if ENV['RAILS_ENV'] == 'test'
    exec 'bundle exec rspec'
  end
end
