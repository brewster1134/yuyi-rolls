class Maven < Yuyi::Roll
  dependencies :homebrew

  install do
    run 'brew install maven'
  end

  uninstall do
    run 'brew uninstall maven'
  end

  upgrade do
    run 'brew upgrade maven'
  end

  installed? do
    run('brew list') =~ /maven/
  end
end
