class Yuyi::Homebrew < Yuyi::Roll
  dependencies :xcode

  install do
    run 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
  end

  uninstall do
    brew_prefix = run 'brew --prefix'
    run "cd #{brew_prefix}"
    run 'git checkout master'
    run 'git ls-files -z | pbcopy'
    run 'rm -rf Cellar'
    run 'bin/brew prune'
    run 'pbpaste | xargs -0 rm'
    run 'rm -r Library/Homebrew Library/Aliases Library/Formula Library/Contributions'
    run 'test -d Library/LinkedKegs && rm -r Library/LinkedKegs'
    run 'rmdir -p bin Library share/man/man1 2> /dev/null'
    run 'rm -rf .git'
    run 'rm -rf ~/Library/Caches/Homebrew'
    run 'rm -rf ~/Library/Logs/Homebrew'
    run 'rm -rf /Library/Caches/Homebrew: No such file or directory'
  end

  upgrade do
    pwd = Dir.pwd
    Dir.chdir '/usr/local/Library/Homebrew'
    run 'git pull origin master -q'
    run 'brew update && brew cleanup'
    Dir.chdir pwd
  end

  installed? do
    command? 'brew -v'
  end
end
