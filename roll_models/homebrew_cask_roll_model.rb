class Yuyi::HomebrewCaskRollModel < Yuyi::Roll
  def self.inherited klass; add_roll klass, caller; end

  def self.homebrew_cask_name name
    dependencies :homebrew_cask

    install do
      run "brew cask install #{name}"
    end

    uninstall do
      run "brew cask uninstall #{name}"
    end

    upgrade do
      run "brew cask install #{name} --force"
      run 'brew cask cleanup'
    end

    installed? do
      run('brew cask list') =~ /#{name}/
    end
  end
end
