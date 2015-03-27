require 'fileutils'

class Yuyi::XcodeCommandLineTools < Yuyi::Roll
  pre_install do

    unless installed?
      run '/usr/bin/sudo /usr/bin/xcode-select --install'
      say 'You should see a prompt to install Xcode command line tools', :type => :warn, :indent => 2
      ask 'Press any key to continue once the installation has been completed.', :type => :warn
    end
  end

  install do
  end

  uninstall do
    FileUtils.rm_rf '/Library/Developer/CommandLineTools'
  end

  upgrade do
    install
  end

  installed? do
    developer_dir = run('/usr/bin/xcode-select -print-path').chomp
    !developer_dir.empty? && File.exist?("#{developer_dir}/usr/bin/git")
  end
end
