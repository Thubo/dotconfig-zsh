alias k9sr="k9s --readonly"

function updateme {
  brew update
  brew update --cask
  brew upgrade
  asdf plugin update --all
  vim +PlugUpgrade +PlugUpdate +qall
  omz update -y
}
