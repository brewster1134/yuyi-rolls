class Yuyi::Npm < Yuyi::Roll
  dependencies :node

  install do
    unless command? 'npm -v'
      run 'curl -L https://npmjs.org/install.sh | sh'
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
