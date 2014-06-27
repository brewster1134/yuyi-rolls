class Yuyi::Vagrant < Yuyi::Roll
  dependencies :homebrew_cask

  options(
    :version => {
      :description => 'Set an older version of vagrant to install (1.4.3, 1.2.7).  Leave blank for the latest version.',
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

  upgrade do
    run "brew cask install vagrant#{virtualbox} --force"
    run 'brew cask cleanup'
  end

  installed? do
    run('brew cask list') =~ /vagrant/
  end

  def version
    options[:version].scan(/[0-9]/).join
  end
end
