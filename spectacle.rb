class Spectacle < Yuyi::Roll
  dependencies :homebrew_cask

  install do
    run 'brew cask install spectacle'
  end

  uninstall do
    run 'brew cask uninstall spectacle'
  end

  upgrade { install }

  installed? do
    run('brew cask list') =~ /spectacle/
  end
end
