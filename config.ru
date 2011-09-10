require 'rubygems'
require 'bundler'

Bundler.require
#require 'sinatra'

root_dir = File.dirname(__FILE__)

set :environment, ENV['RACK_ENV'].to_sym
set :root,        root_dir
set :app_file,    File.join(root_dir, 'geomarcx_coder.rb')
disable :run

log = File.new("/var/www/geo.mar.cx/log/sinatra.log", "a")
STDOUT.reopen(log)
STDERR.reopen(log)

require './geomarcx_coder'

run Sinatra::Application

