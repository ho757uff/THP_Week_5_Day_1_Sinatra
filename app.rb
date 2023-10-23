require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'app/my_project_app'

#require 'views/my_other_file'

MyProjectApp.run! if __FILE__ == $0

# MyProjectApp.new