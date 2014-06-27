class Yuyi::Grunt < Yuyi::NpmGlobalRollModel
  npm_name 'grunt-cli'

  installed? do
    command? 'grunt -V'
  end
end
