require 'rake'
require 'rspec/core/rake_task'
require_relative 'db/config'


desc "create the database"
task "db:create" do
  touch 'db/ar-sunlight-legislators.sqlite3'
end

desc "drop the database"
task "db:drop" do
  rm_f 'db/ar-sunlight-legislators.sqlite3'
end

desc "migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)."
task "db:migrate" do
  ActiveRecord::Migrator.migrations_paths << File.dirname(__FILE__) + 'db/migrate'
  ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
  ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths, ENV["VERSION"] ? ENV["VERSION"].to_i : nil) do |migration|
    ENV["SCOPE"].blank? || (ENV["SCOPE"] == migration.scope)
  end
end

desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end

desc "Run the specs"
RSpec::Core::RakeTask.new(:specs)

task :default  => :specs

desc 'Yolo'
task "db:yolo" do
  rm_f 'db/ar-sunlight-legislators.sqlite3'
  touch 'db/ar-sunlight-legislators.sqlite3'
  ActiveRecord::Migrator.migrations_paths << File.dirname(__FILE__) + 'db/migrate'
  ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
  ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths, ENV["VERSION"] ? ENV["VERSION"].to_i : nil) do |migration|
  ENV["SCOPE"].blank? || (ENV["SCOPE"] == migration.scope)
end
end

desc "Rake Console"
task "console" do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Dir[File.join(File.dirname(__FILE__), 'app/models/*.rb')].each do |model_file|
    require model_file
  end
  require 'irb'
  ARGV.clear
  IRB.start
end
