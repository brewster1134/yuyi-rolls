class Flash < Yuyi::Roll
  dependencies :homebrew_cask

  install do
    run 'brew cask install flash'
  end

  uninstall do
    run 'brew cask uninstall flash'
  end

  upgrade { install }

  installed? do
    run('brew cask list') =~ /flash/
  end
end
