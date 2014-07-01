class Yuyi::HerokuToolbelt < Yuyi::HomebrewCaskRollModel
  homebrew_cask_name 'heroku-toolbelt'

  post_install do
    say 'Open a new terminal window and run `heroku login` to enter your heroku credentials.', :type => :warn, :indent => 2
    ask 'Press any key to continue when you are done', :type => :warn
  end
end
