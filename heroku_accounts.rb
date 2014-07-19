class Yuyi::HerokuAccounts < Yuyi::Roll
  dependencies :heroku_toolbelt

  options({
    :accounts => {
      :description => 'An array of accounts to create',
      :example => [ 'personal', 'work' ],
      :default => []
    }
  })

  install do
    run 'heroku plugins:install git://github.com/ddollar/heroku-accounts.git'
  end

  uninstall do
    run 'heroku plugins:uninstall heroku-accounts'
  end

  upgrade { install }

  installed? do
    command? 'heroku accounts'
  end

  post_install do
    options[:accounts].each do |account|
      run "heroku accounts:add #{account} --auto"
    end
  end
end
