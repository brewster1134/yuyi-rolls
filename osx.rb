class Yuyi::Osx < Yuyi::Roll
  options({
    :commands => {
      :description => 'Array of commands to run on to setup OS X',
      :example => ['defaults write com.apple.screencapture location ~/Downloads']
    }
  })

  post_install do
    options[:commands].each do |command|
      run command
    end
  end

  install {}
  uninstall {}
  upgrade {}
  installed? { false }
end
