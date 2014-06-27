class Yuyi::Rails < Yuyi::Roll
  dependencies :ruby_gems

  options({
    :railsrc => {
      :description => 'A string to be written to your .railsrc file',
      :example => '--skip-test-unit'
    }
  })

  install do
    run 'gem install rails'
    write_to_file '~/.railsrc', options[:railsrc]
  end

  uninstall do
    run 'gem uninstall rails'
    delete_from_file '~/.railsrc', options[:railsrc]
  end

  upgrade do
    run 'gem update rails'
  end

  installed? do
    run('gem list rails') =~ /rails/
  end
end
