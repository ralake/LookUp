require 'data_mapper'
require './app/data_mapper_setup'

task :auto_upgrade do
  DataMapper.auto_upgrade!
  puts "Auto-upgrade complete (no data loss)"
end

task :auto_migrate do 
  DataMapper.auto_migrate!
  puts "Auto-migrate complete (data could have being lost)"
end

task :reek do
  puts `reek app/`
  puts `reek features/` 
  puts `reek features/step_definitions/`
  puts `reek spec/`
  puts `reek spec/features/`
  puts `reek spec/helpers/`
end