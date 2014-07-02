class Yuyi::Ssh < Yuyi::Roll
  post_install do
    run 'ssh-keygen'
  end

  uninstall do
    FileUtils.rm_rf File.expand_path '~/.ssh'
  end

  installed?
    Dir.exists?(File.expand_path('~/.ssh')) && File.exists?(File.expand_path('~/.ssh/id_rsa'))
  end

  install {}
  upgrade {}
end
