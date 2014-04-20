class Ruby < Yuyi::Roll
  C_RUBY_VERSION_REGEX = /^\s+((?:[0-9]+\.?){3}+(?:$|-p[0-9]+))/
  ALL_RUBY_VERSION_REGEX = /^[\s*]{2}(.*[0-9])$/
  ALL_AVAIL_VERSIONS = `rbenv install -l`.scan(ALL_RUBY_VERSION_REGEX).flatten
  AVAIL_C_VERSIONS = `rbenv install -l`.scan(C_RUBY_VERSION_REGEX).flatten
  INSTALLED_VERSIONS = `rbenv versions`.scan(ALL_RUBY_VERSION_REGEX).flatten

  dependencies :rbenv

  options(
    :versions => {
      :description => 'An array of ruby versions you would like to install.',
      :example => (ALL_AVAIL_VERSIONS.unshift '# All available versions...').join("\n"),
      :default => [AVAIL_C_VERSIONS.last]
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

  upgrade do
    # Install the latest version of c ruby if no version are specified in the menu
    # and the latest version is not already installed
    if options[:versions] && options[:versions].empty? && !INSTALLED_VERSIONS.include?(AVAIL_VERSIONS.last)
      run "rbenv install #{AVAIL_C_VERSIONS.last}"
      run "rbenv global #{AVAIL_C_VERSIONS.last}"
    end
  end

  installed? do
    (options[:versions] || []).all?{ |v| INSTALLED_VERSIONS.include? v }
  end

  # Roll methods
  #
  def versions
    # Collect versions from options and make sure they are available through rbenv
    vers = options[:versions].select{ |v| ALL_AVAIL_VERSIONS.include? v }

    # Install the last available version if none specified were available
    vers << AVAIL_C_VERSIONS.last if vers.empty?

    return vers
  end
end
