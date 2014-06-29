class Yuyi::HerokuToolbelt < Yuyi::HomebrewCaskRollModel
  homebrew_cask_name 'heroku-toolbelt'

  post_install do
    say 'Run: `heroku login` to enter your heroku credentials.', :type => :warn
  end
end
