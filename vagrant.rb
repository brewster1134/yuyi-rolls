class Yuyi::Vagrant < Yuyi::Roll
  dependencies :homebrew_cask, :homebrew_cask_versions

  options({
    :version => {
      :description => 'Set an older version of vagrant to install (1.4.3, 1.2.7).  Leave blank for the latest version.',
      :example => '1.4.3'
    },
    :plugins => {
      :description => 'Array of vagrant plugins to install',
      :example => ['vagrant-example-plugin'],
      :default => []
    }
  })

  install do
    run "brew cask install vagrant#{version}"

    options[:plugins].each do |plugin|
      run "vagrant plugin install #{plugin}"
    end
  end

  uninstall do
    run "brew cask uninstall vagrant#{version}"

    options[:plugins].each do |plugin|
      run "vagrant plugin uninstall #{plugin}"
    end
  end

  upgrade do
    run "brew cask install vagrant#{version} --force"
    run 'brew cask cleanup'

    options[:plugins].each do |plugin|
      run "vagrant plugin update #{plugin}"
    end
  end

  installed? do
    run('brew cask list') =~ /vagrant/
  end

  def version
    (options[:version] || '').scan(/[0-9]/).join
  end
end
