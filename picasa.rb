class Picasa < Yuyi::Roll
  dependencies :homebrew_cask

  install do
    run 'brew cask install picasa'
  end

  uninstall do
    run 'brew cask uninstall picasa'
  end

  upgrade { install }

  installed? do
    run('brew cask list') =~ /picasa/
  end
end
