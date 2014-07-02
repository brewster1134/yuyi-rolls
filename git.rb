class Yuyi::Git < Yuyi::HomebrewRollModel
  homebrew_name 'git'

  options({
    :repos => {
      :description => 'An array of git repos to clone'
    }
  })

  # TODO: repos
end
