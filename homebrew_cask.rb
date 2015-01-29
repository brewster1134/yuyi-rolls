class Yuyi::HomebrewCask < Yuyi::Roll
  dependencies :homebrew

  install do
    run 'brew install caskroom/cask/brew-cask'
  end

  uninstall do
    run 'brew uninstall brew-cask'
  end

  upgrade do
    run 'brew upgrade brew-cask && brew cask cleanup'
  end

  installed? do
    command? 'brew cask'
  end
end
