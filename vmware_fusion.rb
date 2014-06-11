class VmwareFusion < Yuyi::Roll
  dependencies :homebrew_cask

  install do
    run 'brew cask install vmware-fusion'
  end

  uninstall do
    run 'brew cask uninstall vmware-fusion'
  end

  upgrade { install }

  installed? do
    run('brew cask list') =~ /vmware-fusion/
  end
end
