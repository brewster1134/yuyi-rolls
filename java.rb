class Yuyi::Java < Yuyi::Roll
  dependencies :homebrew_cask

  options(
    :version => {
      :description => 'Choose between Java 6 or 7',
      :example => 7,
      :default => 7
    }
  )

  install do
    run "brew cask install java#{options[:version]}"
  end

  uninstall do
    run "brew cask uninstall java#{options[:version]}"
  end

  upgrade do
    install
  end

  installed? do
    run('brew cask list') =~ /java#{options[:version]}/
  end
end
