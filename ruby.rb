class Ruby < Yuyi::Roll
  RUBY_VERSION_REGEX = /([0-9]+\.[0-9]+\.[0-9]+-p[0-9]+)/
  AVAIL_VERSIONS = `rbenv install -l`.scan(RUBY_VERSION_REGEX).flatten
  INSTALLED_VERSIONS = `rbenv versions`.scan(RUBY_VERSION_REGEX).flatten

  dependencies :rbenv

  options(
    :versions => {
      :description => 'An array of ruby versions you would like to install',
      :example => [AVAIL_VERSIONS.last],
      :default => AVAIL_VERSIONS.last
    }
  )

  install do
    versions.each do |v|
      run "rbenv install #{v}" unless INSTALLED_VERSIONS.include? v
    end

    run "rbenv global #{versions.last}"
  end

  uninstall do
    versions.each do |v|
      run "rbenv uninstall #{v}"
    end
  end

  update do
    # Install the latest version of ruby if no version are specified in the menu
    # and the latest version is not already installed
    if options[:versions] && options[:versions].empty? && !INSTALLED_VERSIONS.include?(AVAIL_VERSIONS.last)
      run "rbenv install #{AVAIL_VERSIONS.last}"
      run "rbenv global #{AVAIL_VERSIONS.last}"
    end
  end

  installed? do
    (options[:versions] || []).all?{ |v| INSTALLED_VERSIONS.include? v }
  end

  # Roll methods
  #
  def versions
    # Collect versions from options and make sure they are available through rbenv
    versions = (options[:versions] || []).select{ |v| AVAIL_VERSIONS.include? v }

    # Install the last available version if none specified were available
    versions << AVAIL_VERSIONS.last if versions.empty?
  end
end
