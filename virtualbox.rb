class Yuyi::Virtualbox < Yuyi::Roll
  dependencies options[:version] ? :homebrew_cask_versions : :homebrew_cask

  options({
    :version => {
      :description => 'The version of vitualbox to install (4.2.24, 4.3.6, 4.3.12).  Leave blank for the latest version.',
      :example => '4.3.12'
    }
  })

  install do
    run "brew cask install virtualbox#{version}"
  end

  uninstall do
    run "brew cask uninstall virtualbox#{version}"
  end

  upgrade do
    run "brew cask install virtualbox#{version} --force"
    run 'brew cask cleanup'
  end

  installed? do
    run('brew cask list') =~ /virtualbox/
  end

  def version
    return '' unless options[:version]

    ver = options[:version].to_s.scan(/[0-9]/).join
    case ver
    when '4224' then '422492790'
    when '436' then '43691406'
    when '4312' then '431293733'
    end
  end
end
