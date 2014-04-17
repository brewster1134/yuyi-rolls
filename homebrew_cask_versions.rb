class HomebrewCaskVersions < Yuyi::Roll
  dependencies :homebrew

  install do
    run 'brew tap caskroom/versions'
  end

  uninstall do
    run 'brew untap caskroom/versions'
  end

  upgrade do
    say 'Upgraded via Homebrew', :type => :success, :indent => 6
  end

  installed? do
    run('brew tap') =~ /caskroom\/versions/
  end
end
