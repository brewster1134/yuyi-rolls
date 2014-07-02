class Yuyi::HomebrewCask < Yuyi::Roll
  dependencies :homebrew

  install do
    run 'brew tap phinze/homebrew-cask'
    run 'brew install brew-cask'
  end

  uninstall do
    run 'brew untap phinze/homebrew-cask'
    run 'brew uninstall brew-cask'
  end

  upgrade do
    say 'Upgraded via Homebrew', :type => :success, :indent => 4
  end

  installed? do
    command? 'brew cask'
  end

  post_install do
    if on_the_menu? :alfred
      say 'Start Alfred to generate the prefernces file', :type => :warn, :indent => 2
      ask 'Press any key to continue Alfred is running.', :type => :warn
      run 'brew cask alfred link'
    end
  end
end
