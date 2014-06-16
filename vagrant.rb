class Vagrant < Yuyi::Roll
  dependencies :homebrew_cask

  options(
    :version => {
      :description => 'Set an older version to install. Supports `1.4.3` and `1.2.7`.  Leave blank for the latest version.',
      :example => '1.4.3',
      :default => ''
    }
  )

  install do
    dependencies :homebrew_cask_versions if version.empty?
    run "brew cask install vagrant#{version}"
  end

  uninstall do
    run "brew cask uninstall vagrant#{version}"
  end

  upgrade { install }

  installed? do
    run('brew cask list') =~ /vagrant/
  end

  def version
    options[:version].scan(/[0-9]/).join
  end
end
