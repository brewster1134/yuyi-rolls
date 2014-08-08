class Yuyi::Bless < Yuyi::NpmGlobalRollModel
  npm_name 'bless'

  installed? do
    command? 'bless --version'
  end
end
