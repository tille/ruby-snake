require 'rubygems'
require 'bundler/setup' # Releasy doesn't require that your application uses bundler, but it does make things easier.
require 'releasy'

Releasy::Project.new do
  name "Ruby Snake"
  version '0.0.1'

  executable "main.rb"
  files `git ls-files`.split("\n")
  files.exclude '.gitignore'

  exposed_files ["README.txt", "LICENSE"]
  add_link "http://github.com/tille/ruby-snake", "Ruby Snake"
  exclude_encoding

  add_build :windows_standalone do
    icon "app/media/icon.ico"
    add_package :exe
  end
end
