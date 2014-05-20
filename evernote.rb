class Evernote < Yuyi::Roll
  dependencies :homebrew_cask

  install do
    run 'brew cask install evernote'
  end

  uninstall do
    run 'brew cask uninstall evernote'
  end

  upgrade { install }

  installed? do
    run('brew cask list') =~ /evernote/
  end
end
