class Yuyi::Bash < Yuyi::Roll
  dependencies :shell

  options(
    :bashrc => {
      :description => 'An array of lines to add to your .bashrc file.',
      :example => 'set completion-ignore-case on',
      :default => ''
    }
  )

  install do
    run 'brew install bash'

    write_to_file '/etc/shells', '/usr/local/bin/bash'
    write_to_file '~/.bashrc', options[:bashrc]
  end

  uninstall do
    run 'brew uninstall bash'

    delete_from_file '/etc/shells', '/usr/local/bin/bash'
    delete_from_file '~/.bashrc', options[:bashrc]
  end

  upgrade do
    run 'brew upgrade bash'
  end

  installed? do
    run('brew list') =~ /bash/
  end
end
