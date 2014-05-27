class RadiantPlayer < Yuyi::Roll
  dependencies :homebrew_cask, :flash

  install do
    run 'brew cask install radiant-player'
  end

  uninstall do
    run 'brew cask uninstall radiant-player'
  end

  upgrade { install }

  installed? do
    run('brew cask list') =~ /radiant-player/
  end
end
