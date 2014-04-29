class HerokuToolbelt < Yuyi::Roll
  dependencies :homebrew_cask

  install do
    run 'brew cask install heroku-toolbelt'
    # TODO: need to run post install
    # run 'heroku login'
  end

  uninstall do
    run 'brew cask uninstall heroku-toolbelt'
  end

  upgrade { install }

  installed? do
    run('brew cask list') =~ /heroku-toolbelt/
  end
end
