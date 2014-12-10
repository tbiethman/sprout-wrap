#!/usr/bin/env ruby

require 'fileutils'
require 'pathname'

include FileUtils

def install_command_line_tools()
  repository_url = 'https://github.cerner.com/utils/osx-dev-environment-automation.git'
  `git clone #{repository_url}`
  `ruby ./osx-dev-environment-automation/xcode-commandline-tools-install.rb`
  FileUtils.rm_rf(File.join(Dir.getwd, 'osx-dev-environment-automation'))
end

def execute_sprout_setup
  `gem install bundler`
  `bundle exec soloist`
end

install_command_line_tools()
execute_sprout_setup()
