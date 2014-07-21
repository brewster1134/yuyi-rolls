class Yuyi::Shell < Yuyi::Roll
  options({
    :commonrc => {
      :description => 'Array or multiline string of common shell settings',
      :example => ["alias l='ls -lAGh'"]
    }
  })

  install do
    write_to_file '~/.commonrc', options[:commonrc]

    # Add initialization to shell rc files
    if on_the_menu? :bash
      write_to_file '~/.bashrc', commonrc
    end

    if on_the_menu? :zsh
      write_to_file '~/.zshrc', commonrc
    end
  end

  uninstall do
    FileUtils.rm '~/.commonrc'

    if on_the_menu? :bash
      delete_from_file '~/.bashrc', commonrc
    end

    if on_the_menu? :zsh
      delete_from_file '~/.zshrc', commonrc
    end
  end

  upgrade { install }

  installed? do
    File.exists? '~/.commonrc'
  end

  def commonrc
    'source $HOME/.commonrc'
  end
end
