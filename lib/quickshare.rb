$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module Quickshare
  VERSION = '0.0.1'
  
  require "rubygems"
  require 'net/dns/mdns-sd'
  require "webrick"
end