class Yuyi::HerokuToolbelt < Yuyi::HomebrewCaskRollModel
  homebrew_cask_name 'heroku-toolbelt'

  post_install do
    run 'heroku login'
  end
end
