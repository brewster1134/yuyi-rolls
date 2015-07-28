class Yuyi::HomebrewCaskVersions < Yuyi::Roll
  dependencies :homebrew_cask

  install do
    run 'brew tap caskroom/versions'
  end

  uninstall do
    run 'brew untap caskroom/versions'
  end

  upgrade do
    say 'Upgraded via Homebrew', :type => :success, :indent => 4
  end

  installed? do
    run('brew tap') =~ /caskroom\/versions/
  end
end
