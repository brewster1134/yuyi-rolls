class Yuyi::Vagrant < Yuyi::Roll
  dependencies :homebrew_cask
  dependencies :homebrew_cask_versions if options[:version]

  options({
    :version => {
      :description => 'Set an older version of vagrant to install (1.4.3, 1.2.7).  Leave blank for the latest version.',
      :example => '1.4.3'
    }
  })

  install do
    run "brew cask install vagrant#{version}"
  end

  uninstall do
    run "brew cask uninstall vagrant#{version}"
  end

  upgrade do
    run "brew cask install vagrant#{version} --force"
    run 'brew cask cleanup'
  end

  installed? do
    run('brew cask list') =~ /vagrant/
  end

  def version
    (options[:version] || '').scan(/[0-9]/).join
  end
end
