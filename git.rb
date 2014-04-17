class Git < Yuyi::Roll
  dependencies :homebrew

  install do
    run 'brew install git'
  end

  uninstall do
    run 'brew uninstall git'
  end

  upgrade do
    run 'brew upgrade git'
  end

  installed? do
    run('brew list') =~ /git/
  end
end
