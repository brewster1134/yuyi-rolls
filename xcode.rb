require 'fileutils'

class Xcode < Yuyi::Roll
  pre_install do
    if !installed? && osx_version >= 10.9
      run '/usr/bin/sudo /usr/bin/xcode-select --install'
    else
      say 'Make sure XCode command line tools are installed.', :type => :warn
      say ' * Install xcode through the App Store', :type => :warn
      say ' * Install the command line tools through XCode\'s Preferences > Downloads', :type => :warn
    end
    ask 'Press any key to continue once the xcode command line tools are installed', :type => :warn
  end

  install do
  end

  uninstall do
    FileUtils.rm_rf '/Applications/Xcode.app'
  end

  upgrade do
    say 'Upgrading Xcode is not yet supported with Yuyi.  Please upgrade Xcode through the App Store.'
  end

  installed? do
    return false unless osx_version >= 10.9

    developer_dir = run '/usr/bin/xcode-select -print-path'
    !developer_dir.empty? && File.exist?("#{developer_dir}/usr/bin/git")
  end
end
