require 'yaml'

class Yuyi::RubyGems < Yuyi::Roll
  dependencies :ruby

  options({
    :gemrc => {
      :description => 'An object to be written to your .gemrc file',
      :example => { :gem => '--no-document' },
      :default => {}
    }
  })

  install do
    write_to_file '~/.gemrc', options[:gemrc].to_yaml
  end

  uninstall do
    delete_from_file '~/.gemrc', options[:gemrc].to_yaml
  end

  upgrade do
    run 'gem update --system'
  end

  installed? do
    command? 'gem -v'
  end

  post_install do
    say 'If you publish gems to rubygems, open a new terminal window and run `gem push` to enter your credentials.', :type => :warn, :indent => 2
    ask 'Press any key to continue when you are done, or if you do not have/want a rubygems account.', :type => :warn
  end
end
