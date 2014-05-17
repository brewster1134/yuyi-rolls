class Homebrew < Yuyi::Roll
  install do
    run 'ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"'
  end

  uninstall do
    run 'sh "$(curl -fsSL https://gist.github.com/mxcl/1173223/raw/a833ba44e7be8428d877e58640720ff43c59dbad/uninstall_homebrew.sh)"'
  end

  upgrade do
    puts run 'date'
    pwd = Dir.pwd
    Dir.chdir '/usr/local/Library/Homebrew'
    run 'git pull origin master && brew update'
    Dir.chdir pwd
  end

  installed? do
    command? 'brew -v'
  end
end
