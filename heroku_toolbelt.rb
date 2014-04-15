class HerokuToolbelt < Yuyi::Roll
  dependencies :homebrew_cask

  install do
    run 'brew cask install heroku-toolbelt'
    run 'heroku login'
  end

  uninstall do
    run 'brew cask uninstall heroku-toolbelt'
  end

  update { install }

  installed? do
    run('brew cask list') =~ /heroku-toolbelt/
  end
end
