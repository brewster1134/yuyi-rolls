class Yuyi::SublimeText < Yuyi::Roll
  dependencies options[:version] == 2 ? :homebrew_cask : :homebrew_cask_versions

  options({
    :version => {
      :description => 'Specify between Sublime Text 2 or 3',
      :example => 3,
      :default => 3
    }
  })

  install do
    if options[:version] == 2
      run 'brew cask install sublime-text'
    else
      run 'brew cask install sublime-text-3'
    end
  end

  uninstall do
    if options[:version] == 2
      run 'brew cask uninstall sublime-text'
    else
      run 'brew cask uninstall sublime-text-3'
    end
  end

  upgrade { install }

  installed? do
    if options[:version] != 2
      run('brew cask list') =~ /sublime-text3/
    else
      run('brew cask list') =~ /sublime-text/
    end
  end
end
