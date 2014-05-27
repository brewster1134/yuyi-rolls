class Adium < Yuyi::Roll
  dependencies :homebrew_cask

  install do
    run 'brew cask install adium'
  end

  uninstall do
    run 'brew cask uninstall adium'
  end

  upgrade { install }

  installed? do
    run('brew cask list') =~ /adium/
  end
end
