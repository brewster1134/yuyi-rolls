class Yuyi::Osx < Yuyi::Roll
  options(
    :commands => {
      :description => 'Array of commands to run on to setup OS X',
      :example => ['defaults write com.apple.screencapture location ~/Downloads'],
      :default => []
    }
  )

  install do
    options[:commands].each do |command|
      run command
    end
  end

  uninstall {}
  upgrade {}
  installed? { false }
end
