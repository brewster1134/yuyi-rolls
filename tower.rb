class Tower < Yuyi::Roll
  dependencies :homebrew_cask

  install do
    run 'brew cask install tower'
  end

  uninstall do
    run 'brew cask uninstall tower'
  end

  upgrade { install }

  installed? do
    run('brew cask list') =~ /tower/
  end
end
