class HerokuToolbelt < Yuyi::Roll
  dependencies :homebrew_cask

  install do
    run 'brew cask install heroku-toolbelt'
  end

  post_install do
    run 'heroku login'
  end

  uninstall do
    run 'brew cask uninstall heroku-toolbelt'
  end

  upgrade do
    install
  end

  installed? do
    run('brew cask list') =~ /heroku-toolbelt/
  end
end
