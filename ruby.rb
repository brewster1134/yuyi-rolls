class Ruby < Yuyi::Roll
  RBENV_RUBY_VERSION_REGEX = /^[\s*]{2}(.*)$/

  dependencies :rbenv

  options(
    :versions => {
      :description => 'An array of ruby versions you would like to install (in order of oldest to newest by version).',
      :example => [ '2.1.1' ],
      :required => true
    }
  )

  install do
    versions.each do |v|
      run "rbenv install #{v}" unless installed_versions.include? v
    end

    # set the last version to be the global version
    run "rbenv global #{versions.last}"
  end

  uninstall do
    versions.each do |v|
      run "rbenv uninstall #{v}"
    end
  end

  upgrade do
    install
  end

  installed? do
    (options[:versions] || []).all?{ |v| installed_versions.include? v }
  end

  # Roll methods
  #
  def available_versions
    @available_versions ||= `rbenv install -l`.scan(RBENV_RUBY_VERSION_REGEX).flatten
  end

  def installed_versions
    @installed_versions ||= `rbenv versions`.scan(RBENV_RUBY_VERSION_REGEX).flatten
  end

  def versions
    @versions ||= options[:versions].select{ |v| available_versions.include? v }
  end
end
