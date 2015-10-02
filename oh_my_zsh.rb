class Yuyi::OhMyZsh < Yuyi::Roll
  dependencies :zsh, :git

  options({
    :plugins => {
      :description => 'An array of plugins to load.',
      :example => [ 'git' ]
    }
  })

  install do
    run 'curl -L http://install.ohmyz.sh | sh'

    # set plugins
    if options[:plugins]
      delete_from_file '~/.zshrc', 'plugins=(git)'
      write_to_file '~/.zshrc', "plugins=(#{options[:plugins].join(' ')})"
    end
  end

  uninstall do
    run 'uninstall_oh_my_zsh'

    # remove plugins
    if options[:plugins]
      delete_from_file '~/.zshrc', "plugins=(#{options[:plugins].join(' ')})"
    end
  end

  upgrade do
    run '(cd ~/.oh-my-zsh && git reset --hard && upgrade_oh_my_zsh)'
  end

  installed? do
    File.exists?(File.expand_path('~/.oh-my-zsh'))
  end
end
