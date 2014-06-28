class Yuyi::Atom < Yuyi::HomebrewCaskRollModel
  homebrew_cask_name 'atom'

  install do
    run 'brew cask install atom'

    if on_the_menu? :shell
      write_to_file '~/.commonrc', commonrc
    end
  end

  uninstall do
    run 'brew cask uninstall atom'
    delete_from_file '~/.commonrc', commonrc
  end

  def commonrc
    [
      '# EDITOR: Atom',
      "export EDITOR='atom -w'"
    ]
  end
end
