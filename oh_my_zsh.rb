class Yuyi::OhMyZsh < Yuyi::Roll
  dependencies :shell

  options({
    :zshrc => {
      :description => 'An array or multiline string of lines to add to your .zshrc file.',
      :example => [ 'unsetopt append_history' ]
    },
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

    write_to_file '~/.zshrc', options[:zshrc]
  end

  uninstall do
    run 'uninstall_oh_my_zsh'

    delete_from_file '~/.zshrc', options[:zshrc]
  end

  upgrade do
    run 'upgrade_oh_my_zsh'
  end

  installed? do
    File.read('/etc/shells').include? '/bin/zsh'
  end
end
