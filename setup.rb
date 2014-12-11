#!/usr/bin/env ruby

require 'fileutils'
require 'pathname'

include FileUtils

def install_command_line_tools()
  repository_url = 'http://github.cerner.com/utils/osx-dev-environment-automation.git'
  puts "Cloning #{repository_url}"
  system("git clone #{repository_url}")

  puts 'Installing command line tools'
  system("ruby ./osx-dev-environment-automation/xcode-commandline-tools-install.rb")
  
  puts 'Removing command line tools automation script'
  FileUtils.rm_rf(File.join(Dir.getwd, 'osx-dev-environment-automation'))
end

def execute_sprout_setup
  puts 'Installing bundler'
  system("gem install bundler")

  puts 'Running sprout setup'
  system("bundle exec soloist")
end

install_command_line_tools()
execute_sprout_setup()
