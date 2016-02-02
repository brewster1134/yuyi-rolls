class Yuyi::Maven < Yuyi::Roll
  dependencies :homebrew_cask_versions

  options({
    :opts => {
      :description => 'String to set to MAVEN_OPTS environment variable',
      :example => '-Xmx512m'
    },
    :version => {
      :description => 'Version of Maven to install',
      :example => '3.1',
      :default => ''
    }
  })

  install do
    if options[:version]
      run "brew install homebrew/versions/maven#{version}"
    else
      run "brew install maven"
    end

    if on_the_menu? :shell
      write_to_file '~/.commonrc', opts
    end
  end

  uninstall do
    if options[:version]
      run "brew uninstall homebrew/versions/maven#{version}"
    else
      run "brew uninstall maven"
    end

    if on_the_menu? :shell
      delete_from_file '~/.commonrc', opts
    end
  end

  upgrade { install }
  end

  installed? do
    run('brew list') =~ /maven#{version}/
  end

  def opts
    [
      '# MAVEN',
      "export MAVEN_OPTS='#{options[:opts]}'"
    ]
  end

  def version
    (options[:version] || '').scan(/[0-9]/).join()
  end
end
