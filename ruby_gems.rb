require 'yaml'

class RubyGems < Yuyi::Roll
  dependencies :ruby

  options(
    :gemrc => {
      :description => 'An object to be written to your .gemrc file',
      :example => { :gem => '--no-document' },
      :default => {}
    }
  )

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
    # Prompts to enter rubygems credentials, but will fail because there is no gem to publish
    # TODO: find a better way to do this
    run `gem push`
  end
end
