class Yuyi::Rbenv < Yuyi::Roll
  dependencies :homebrew

  install do
    # Remove RVM
    run 'rvm implode' if command? 'rvm -v'

    # Install
    run 'brew install rbenv ruby-build'

    # Add initialization to shell

    if on_the_menu? :shell
      write_to_file '~/.commonrc', commonrc
    end

    run 'export RBENV_ROOT=/usr/local/var/rbenv'
    run 'eval "$(rbenv init -)"'
    run 'rbenv rehash'
  end

  uninstall do
    run 'brew uninstall rbenv ruby-build'

    if on_the_menu? :shell
      delete_from_file '~/.commonrc', commonrc
    end
  end

  upgrade do
    run 'brew upgrade rbenv ruby-build'
  end

  installed? do
    command?('rbenv -v') && run('brew list') =~ /rbenv/ && run('brew list') =~ /ruby-build/
  end

  post_install do
    run 'rbenv rehash'
  end

  def commonrc
    [
      '# RBENV',
      'export RBENV_ROOT=/usr/local/var/rbenv',
      'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi'
    ]
  end
end
