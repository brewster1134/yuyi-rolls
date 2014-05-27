class Virtualbox < Yuyi::Roll
  dependencies :homebrew_cask

  install do
    run 'brew cask install virtualbox'
  end

  uninstall do
    run 'brew cask uninstall virtualbox'
  end

  upgrade { install }

  installed? do
    run('brew cask list') =~ /virtualbox/
  end
end
