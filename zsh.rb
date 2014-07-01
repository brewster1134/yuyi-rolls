class Yuyi::Zsh < Yuyi::HomebrewRollModel
  homebrew_name 'zsh'

  options({
    :zshrc => {
      :description => 'An array or multiline string of lines to add to your .zshrc file.',
      :example => [ 'unsetopt append_history' ]
    },
  })

  install do
    run 'brew install zsh'
    write_to_file '~/.zshrc', options[:zshrc]
  end

  uninstall do
    run 'brew uninstall zsh'
    delete_from_file '~/.zshrc', options[:zshrc]
  end

  installed? do
    File.read('/etc/shells').include? '/bin/zsh'
  end

  post_install do
    say title, :type => :success

    if options[:uninstall]
      say 'Edit `/etc/shells` and remove the line `/bin/zsh`', :type => :warn, :indent => 2
    else
      say 'Edit `/etc/shells` and add the line `/bin/zsh`', :type => :warn, :indent => 2
      ask 'Press any key to continue once the the line has been successfully added & the file saved.', :type => :warn

      say 'Switching to zsh', :type => :warn, :indent => 2
      run 'chsh -s /bin/zsh'
    end
  end
end
