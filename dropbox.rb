class Dropbox < Yuyi::Roll
  dependencies :homebrew_cask

  install do
    run 'brew cask install dropbox'
  end

  uninstall do
    run 'brew cask uninstall dropbox'
  end

  upgrade { install }

  installed? do
    run('brew cask list') =~ /dropbox/
  end
end
