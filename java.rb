class Yuyi::Java < Yuyi::Roll
  dependencies :homebrew_cask

  options({
    :version => {
      :description => 'Choose an older version of java (6, 7).  Leave blank for the latest version.',
      :example => 7
    }
  })

  install do
    dependencies :homebrew_cask_versions if options[:version]

    run "brew cask install java#{options[:version]}"

    if on_the_menu? :shell
      write_to_file '~/.commonrc', opts
    end
  end

  uninstall do
    run "brew cask uninstall java#{options[:version]}"

    if on_the_menu? :shell
      delete_from_file '~/.commonrc', opts
    end
  end

  upgrade do
    run "brew cask install java#{options[:version]} --force"
    run 'brew cask cleanup'
  end

  installed? do
    run('brew cask list') =~ /java#{options[:version]}/
  end

  def opts
    [
      '# JAVA',
      'export JAVA_HOME=$(/usr/libexec/java_home)'
    ]
  end
end
