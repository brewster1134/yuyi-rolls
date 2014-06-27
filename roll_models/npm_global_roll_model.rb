class Yuyi::NpmGlobalRollModel < Yuyi::Roll
  def self.inherited klass; add_roll klass, caller; end

  def self.npm_name name
    @@name = name

    dependencies :npm

    install do
      run "npm install #{@@name} -g"
    end

    uninstall do
      run "npm uninstall #{@@name} -g"
    end

    upgrade do
      run "npm update #{@@name} -g"
    end

    installed? do
      command? "#{@@name} -v"
    end
  end
end
