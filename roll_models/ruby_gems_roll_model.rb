class Yuyi::RubyGemsRollModel < Yuyi::Roll
  def self.inherited klass; add_roll klass, caller; end

  def self.gem_name name
    @@name = name

    dependencies :ruby_gems

    install do
      run "gem install #{@@name}"
    end

    uninstall do
      run "gem uninstall #{@@name}"
    end

    upgrade do
      run "gem update #{@@name}"
    end

    installed? do
      run("gem list #{@@name}") =~ /#{@@name}/
    end
  end
end
