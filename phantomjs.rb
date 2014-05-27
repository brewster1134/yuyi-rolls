class Phantomjs < Yuyi::Roll
  dependencies :homebrew

  install do
    run 'brew install phantomjs'
  end

  uninstall do
    run 'brew uninstall phantomjs'
  end

  upgrade do
    run 'brew upgrade phantomjs'
  end

  installed? do
    run('brew list') =~ /phantomjs/
  end
end
