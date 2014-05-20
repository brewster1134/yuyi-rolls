class Zsh < Yuyi::Roll
  install do
    run 'curl -L http://install.ohmyz.sh | sh'
  end

  uninstall do
    run 'uninstall_oh_my_zsh'
  end

  upgrade do
    run 'upgrade_oh_my_zsh'
  end

  installed? do
    File.read('/etc/shells').include? '/bin/zsh'
  end
end
