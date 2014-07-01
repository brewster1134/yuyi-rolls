class Yuyi::OhMyZsh < Yuyi::Roll
  dependencies :shell, :zsh

  options({
    :plugins => {
      :description => 'An array of plugins to load.',
      :example => [ 'git' ]
    }
  })

  install do
    run 'curl -L http://install.ohmyz.sh | sh'

    # plugins
    delete_from_file '~/.zshrc', 'plugins=(git)'
    write_to_file '~/.zshrc', options[:plugins]
  end

  uninstall do
    run 'uninstall_oh_my_zsh'

    delete_from_file '~/.zshrc', options[:plugins]
  end

  upgrade do
    run 'upgrade_oh_my_zsh'
  end

  installed? do
    File.exists?(File.expand_path('~/.oh-my-zsh'))
  end
end
