require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'controller'

run ApplicationController
# ApplicationController.runbundle binstub rackup! if __FILE__ == $0