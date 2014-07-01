class Yuyi::Bash < Yuyi::Roll
  dependencies :shell

  options({
    :bashrc => {
      :description => 'An array or multiline string of lines to add to your .bashrc file.',
      :example => 'set completion-ignore-case on'
    }
  })

  install do
    run 'brew install bash'

    write_to_file '~/.bashrc', options[:bashrc]
  end

  uninstall do
    run 'brew uninstall bash'

    say 'To uninstall bash completely, you will need to delete the line `/usr/local/bin/bash` from the file `/etc/shells`', :type => :warn
    delete_from_file '~/.bashrc', options[:bashrc]
  end

  upgrade do
    run 'brew upgrade bash'
  end

  installed? do
    run('brew list') =~ /bash/
  end

  post_install do
    say title, :type => :success
    say 'Edit `/etc/shells` and add the line `/usr/local/bin/bash`', :type => :warn, :indent => 2
  end
end
