require 'rubygems'
require 'active_record'
require 'yaml'
require 'logger'

task :default => :migrate

task :migrate => :environment do
  ActiveRecord::Migrator.migrate('dbfiles/migrate', ENV["VERSION"] ? ENV["VERSION"].to_i : nil )
end

task :environment do
  ActiveRecord::Base.establish_connection(YAML::load(File.open('database.yml')))
  ActiveRecord::Base.logger = Logger.new(File.open('database.log', 'a'))
end
