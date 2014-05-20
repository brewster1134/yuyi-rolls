class Atom < Yuyi::Roll
  dependencies :homebrew_cask

  install do
    run 'brew cask install atom'
  end

  uninstall do
    run 'brew cask uninstall atom'
  end

  upgrade { install }

  installed? do
    run('brew cask list') =~ /atom/
  end
end
