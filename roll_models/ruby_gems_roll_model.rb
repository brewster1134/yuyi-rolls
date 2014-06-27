class Yuyi::RubyGemsRollModel < Yuyi::Roll
  def self.inherited klass; super klass; end

  def self.gem_name name
    dependencies :ruby_gems

    install do
      run "gem install #{bundler}"
    end

    uninstall do
      run "gem uninstall #{bundler}"
    end

    upgrade do
      run "gem update #{bundler}"
    end

    installed? do
      run("gem list #{bundler}") =~ /#{bundler}/
    end
  end
end
