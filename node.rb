class Node < Yuyi::Roll
  dependencies :homebrew

  install do
    run 'brew install node'
  end

  uninstall do
    run 'brew uninstall node'
  end

  upgrade do
    run 'brew upgrade node'
  end

  installed? do
    run('brew list') =~ /node/
  end
end
