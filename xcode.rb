require 'fileutils'

class Yuyi::Xcode < Yuyi::Roll
  pre_install do
    unless installed?
      say '* Open the App Store and install Xcode', :type => :warn, :indent => 2
      say '* Open Xcode and accept the terms & conditions', :type => :warn, :indent => 2
      ask 'Press any key to continue after you have performed these steps.', :type => :warn
    end
  end

  install do
  end

  uninstall do
    FileUtils.rm_rf '/Applications/Xcode.app'
  end

  upgrade do
    say 'Upgrading Xcode must be done through the OSX App Store', :indent => 4, :type => :warn
  end

  installed? do
    File.exist?('/Applications/Xcode.app')
  end
end
