class Java < Yuyi::Roll
  dependencies :homebrew_cask

  install do
    run 'brew cask install java7'
  end

  uninstall do
    run 'brew cask uninstall java7'
  end

  upgrade { install }

  installed? do
    run('brew cask list') =~ /java7/
  end
end

# TODO: support installing java6 option
