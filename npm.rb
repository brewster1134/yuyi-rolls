class Npm < Yuyi::Roll
  dependencies :node

  install do
    unless command? 'npm'
      run 'curl https://npmjs.org/install.sh | sh'
    end
  end

  uninstall do
    run 'npm uninstall npm -g'
  end

  upgrade do
    run 'npm update npm -g'
  end

  installed? do
    command? 'npm -v'
  end
end
