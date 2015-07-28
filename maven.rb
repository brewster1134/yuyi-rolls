class Yuyi::Maven
  dependencies :homebrew_cask_versions

  options({
    :opts => {
      :description => 'String to set to MAVEN_OPTS environment variable',
      :example => '-Xmx512m'
    },
    :version => {
      :description => 'Version of Maven to install',
      :example => '3.1'
    }
  })

  install do
    run "brew install maven#{version}"

    if on_the_menu? :shell
      write_to_file '~/.commonrc', opts
    end
  end

  uninstall do
    run "brew uninstall maven#{version}"

    if on_the_menu? :shell
      delete_from_file '~/.commonrc', opts
    end
  end

  upgrade do
    run "brew upgrade maven#{version}"

    if on_the_menu? :shell
      write_to_file '~/.commonrc', opts
    end
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
