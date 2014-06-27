class Yuyi::HomebrewRollModel < Yuyi::Roll
  def self.inherited klass; super klass; end

  def self.homebrew_name name
    @@name = name
  end

  dependencies :homebrew

  install do
    run "brew install #{@@name}"
  end

  uninstall do
    run "brew uninstall #{@@name}"
  end

  upgrade do
    run "brew upgrade #{@@name}"
  end

  installed? do
    run('brew list') =~ /#{@@name}/
  end
end
