class Rails < Yuyi::Roll
  dependencies :ruby_gems

  install do
    run 'gem install rails'
  end

  uninstall do
    run 'gem uninstall rails'
  end

  upgrade do
    run 'gem update rails'
  end

  installed? do
    run('gem list rails') =~ /rails/
  end
end

# TODO:
# .railsrc
