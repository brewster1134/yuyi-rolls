class YuyiGem < Yuyi::Roll
  dependencies :ruby_gems

  install do
    run 'gem install yuyi'
  end

  uninstall do
    run 'gem uninstall yuyi'
  end

  upgrade do
    run 'gem update yuyi'
  end

  installed? do
    run('gem list yuyi') =~ /yuyi/
  end
end
