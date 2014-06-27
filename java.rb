class Yuyi::Java < Yuyi::Roll
  dependencies :homebrew_cask

  options({
    :version => {
      :description => 'Choose between Java 6 or 7',
      :example => 7,
      :default => 7
    }
  })

  install do
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
      'export JAVA_HOME=$(/usr/libexec/java_home)',
      "\n"
    ]
  end
end
