class Filezilla < Yuyi::Roll
  dependencies :homebrew_cask

  install do
    run 'brew cask install filezilla'
  end

  uninstall do
    run 'brew cask uninstall filezilla'
  end

  upgrade { install }

  installed? do
    run('brew cask list') =~ /filezilla/
  end
end
