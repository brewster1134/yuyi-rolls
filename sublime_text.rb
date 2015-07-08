class Yuyi::SublimeText < Yuyi::Roll
  dependencies :homebrew_cask, :homebrew_cask_versions

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
      run 'brew cask install sublime-text3'
    end

    if on_the_menu? :shell
      write_to_file '~/.commonrc', commonrc
    end
  end

  uninstall do
    if options[:version] == 2
      run 'brew cask uninstall sublime-text'
    else
      run 'brew cask uninstall sublime-text3'
    end

    delete_from_file '~/.commonrc', commonrc
  end

  upgrade { install }

  installed? do
    if options[:version] != 2
      run('brew cask list') =~ /sublime-text3/
    else
      run('brew cask list') =~ /sublime-text/
    end
  end

  def commonrc
    [
      '# EDITOR: Sublime Text',
      "export EDITOR='subl -w'"
    ]
  end
end
