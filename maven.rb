class Yuyi::Maven < Yuyi::HomebrewRollModel
  options(
    :opts => {
      :description => 'String to set to MAVEN_OPTS environment variable',
      :example => '-Xmx512m',
      :default => ''
    }
  )

  install do
    run 'brew install maven'

    if on_the_menu? :shell
      write_to_file '~/.commonrc', opts
    end
  end

  uninstall do
    run 'brew uninstall maven'

    if on_the_menu? :shell
      delete_from_file '~/.commonrc', opts
    end
  end

  upgrade do
    run 'brew upgrade maven'

    if on_the_menu? :shell
      write_to_file '~/.commonrc', opts
    end
  end

  installed? do
    run('brew list') =~ /maven/
  end

  def opts
    [
      '# MAVEN',
      "export MAVEN_OPTS='#{options[:opts]}'",
      "\n"
    ]
  end
end
