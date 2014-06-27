class Yuyi::NpmGlobalRollModel < Yuyi::Roll
  def self.inherited klass; super klass; end

  def self.npm_name name
    @@name = name
  end

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
