class RubyGems < Yuyi::Roll
  dependencies :ruby

  install do
  end

  uninstall do
  end

  upgrade do
    run 'gem update --system'
  end

  installed? do
    command? 'gem -v'
  end
end
