require 'fileutils'

class Yuyi::Xcode < Yuyi::Roll
  pre_install do
    next if installed?

    unless xcode_installed?
      say 'Open the App Store and install Xcode', :type => :warn, :indent => 2
    end

    say 'Make sure you open Xcode an accept the terms & conditions', :type => :warn, :indent => 2
    ask 'Press any key to continue once Xcode is installed and the terms & conditions have been accepted.', :type => :warn

    if !xcode_command_line_tools_installed?
      run '/usr/bin/sudo /usr/bin/xcode-select --install'
    else
      say 'Make sure Xcode command line tools are installed.', :type => :warn, :indent => 2
      say 'Install the command line tools through Xcode\'s Preferences > Downloads', :type => :warn, :indent => 4
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
    else
      say 'Upgrading Xcode is not yet supported with Yuyi.  Please upgrade Xcode through the App Store.', :indent => 4, :type => :warn
    end
  end

  installed? do
    xcode_installed? && xcode_command_line_tools_installed?
  end

  def xcode_installed?
    File.exist?('/Applications/Xcode.app')
  end

  def xcode_command_line_tools_installed?
    developer_dir = run('/usr/bin/xcode-select -print-path').chomp
    !developer_dir.empty? && File.exist?("#{developer_dir}/usr/bin/git")
  end
end
