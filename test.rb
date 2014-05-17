class Test < Yuyi::Roll
  install do
    run 'gem install new'
  end

  uninstall do
    run 'date'
  end

  upgrade do
    run 'date'
  end

  installed? do
    command? 'fuck'
  end
end
