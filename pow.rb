class Yuyi::Pow < Yuyi::HomebrewRollModel
  options({
    :powconfig => {
      :description => 'An array or multiline string of lines to add to your .powconfig file.',
      :example => ['export PATH=/usr/local/var/rbenv/shims:$PATH']
    }
  })

  install do
    run 'brew install pow'
    write_to_file '~/.powconfig', options[:powconfig]
  end

  uninstall do
    run 'brew uninstall pow'
    FileUtils.rm File.expand_path('~/.powconfig')
  end
end
