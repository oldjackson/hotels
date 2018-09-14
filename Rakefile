# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
require File.expand_path('../config/application', __FILE__)
# require 'rspec/core/rake_task'

# # RSpec::Core::RakeTask.new(:spec)

Rails.application.load_tasks

desc "Look for style guide offenses in your code"
task :rubocop do
  sh "rubocop --format simple || true"
end

task default: :rubocop
