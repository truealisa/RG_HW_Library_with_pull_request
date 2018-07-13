require 'yaml'
require './library.rb'

if File.exist?('lib_data.yml')
  lib = YAML.load(File.read('lib_data.yml'))
else
  lib = Library.new
  lib.populate_library
  lib_file = File.new('lib_data.yml', 'w')
  lib_file.write(lib.to_yaml)
  lib_file.close
end

lib.most_active_reader
puts "\n"
lib.most_popular_book
puts "\n"
lib.count_readers_of_popular_book
