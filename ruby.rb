class Yuyi::Ruby < Yuyi::Roll
  @@rbenv_ruby_version_regex = /^.{2}([^\s]+)/

  dependencies :rbenv

  options({
    :versions => {
      :description => 'An array of ruby versions you would like to install (in order of oldest to newest by version).',
      :example => [ '2.1.2' ],
      :required => true
    }
  })

  install do
    puts 'install', versions.inspect
    versions.each do |v|
      run "rbenv install #{v}" unless installed_versions.include? v
    end

    # set the last version to be the global version
    run 'rbenv rehash'
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
    begin installed_versions
      options[:versions].all?{ |v| installed_versions.include? v }
    rescue
      false
    end
  end

  # Roll methods
  #
  def available_versions
    @available_versions ||= run('rbenv install -l').scan(@@rbenv_ruby_version_regex).flatten
  end

  def installed_versions
    @installed_versions ||= run('rbenv versions').scan(@@rbenv_ruby_version_regex).flatten
  end

  def versions
    @versions ||= options[:versions].select{ |v| available_versions.include? v }
  end
end
