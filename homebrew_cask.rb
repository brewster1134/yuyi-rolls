class HomebrewCask < Yuyi::Roll
  dependencies :homebrew

  install do
    run 'brew tap phinze/homebrew-cask'
    run 'brew install brew-cask'

    if on_the_menu? :alfred
      run 'brew cask alfred'
    end
  end

  uninstall do
    run 'brew untap phinze/homebrew-cask'
    run 'brew uninstall brew-cask'
  end

  update do
    say 'Updated via Homebrew', :type => :success, :indent => 6
  end

  installed? do
    command? 'brew cask'
  end
end
