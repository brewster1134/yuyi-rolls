class Imagemagick < Yuyi::Roll
  dependencies :homebrew

  install do
    run 'brew install imagemagick'
  end

  uninstall do
    run 'brew uninstall imagemagick'
  end

  upgrade do
    run 'brew upgrade imagemagick'
  end

  installed? do
    run('brew list') =~ /imagemagick/
  end
end
