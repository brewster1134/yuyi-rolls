class Yuyi::Pow < Yuyi::Roll
  options({
    :powconfig => {
      :description => 'An array or multiline string of lines to add to your .powconfig file.',
      :example => ['export FOO=bar']
    }
  })

  installed? do
    Dir.exists? File.expand_path('~/Library/Application Support/Pow')
  end

  install do
    run 'curl get.pow.cx | sh'
    write_to_file '~/.powconfig', options[:powconfig]
  end

  upgrade{ install }

  uninstall do
    run 'curl get.pow.cx/uninstall.sh | sh'
    FileUtils.rm File.expand_path('~/.powconfig')
  end
end
