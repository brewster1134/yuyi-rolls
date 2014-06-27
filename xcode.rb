require 'fileutils'

class Yuyi::Xcode < Yuyi::Roll
  pre_install do
    next if installed?

    if osx_version >= 10.9
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
    if installed?
      say 'Xcode is already installed', :indent => 4, :type => :success
    end

    say 'Upgrading Xcode is not yet supported with Yuyi.  Please upgrade Xcode through the App Store.', :indent => 4, :type => :warn
  end

  installed? do
    return false if osx_version < 10.9

    developer_dir = run('/usr/bin/xcode-select -print-path').chomp
    !developer_dir.empty? && File.exist?("#{developer_dir}/usr/bin/git")
  end
end
