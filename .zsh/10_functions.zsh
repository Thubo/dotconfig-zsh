function wait_for_ssh {

  ssh $1
  while test $? -gt 0
  do
     echo "Trying again in 5s..."
     sleep 5 # highly recommended - if it's in your local network, it can try an awful lot pretty quick...
     echo "Trying again..."
     ssh $1
  done

}

function updateme {

  unameOut="$(uname -s)"
  case "${unameOut}" in
      Linux*)     machine=Linux;;
      Darwin*)    machine=Mac;;
      CYGWIN*)    machine=Cygwin;;
      MINGW*)     machine=MinGw;;
      *)          machine="UNKNOWN:${unameOut}"
  esac

  vcsh pull

  vim +PlugUpgrade +PlugUpdate +qall

  echo
  echo "# Running update commands for ${machine}"
  echo

  if [[ ${machine} == "Mac" ]] ; then
    brew update
    brew update --cask
    brew upgrade
    asdf plugin update --all
  fi

  if [[ ${machine} == "Linux" ]] ; then
    sudo apt-get update
    sudo apt-get upgrade -y
    sudo apt-get autoremove -y
  fi

  if command -v docker &> /dev/null ; then
    docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /etc/localtime:/etc/localtime:ro containrrr/watchtower --run-once 2>&1
    docker system prune -af --volumes
  fi

  if [[ -f $ZSH_CUSTOM/.mrconfig ]] ; then
    mr -j5 -c $ZSH_CUSTOM/.mrconfig up
  fi

  omz update -y

}
