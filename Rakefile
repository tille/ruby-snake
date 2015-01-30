require 'ocra'
require 'releasy'
require 'bundler/setup'

Releasy::Project.new do
  name "Ruby Snake"
  version '0.0.1'

  executable "main.rb"
  files ["app/**/*.*"]
  exclude_encoding

  add_build :windows_folder do
    icon "app/media/icon.ico"
    add_package :exe
  end

  add_build :windows_wrapped do
    wrapper "wrappers/ruby-1.9.3-p551-i386-mingw32.7z"
    executable_type :windows
    exclude_tcl_tk
    add_package :zip
  end
end



