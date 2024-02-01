function get_file_age_seconds() {
    local filename="$1"
    if [ -f "$filename" ]; then
        local current_time=$(date +%s)
        local last_modified=$(stat -c "%Y" "$filename")
        local age=$((current_time - last_modified))
        echo "$age"
    else
        echo "File not found or not a regular file"
    fi
}

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

  echo
  echo "# Updating configs, repos and tools"
  echo

  vcsh pull

  vim +PlugUpgrade +PlugUpdate +qall

  if [[ -f $ZSH_CUSTOM/.mrconfig ]] ; then
    mr -j10 -m -c $ZSH_CUSTOM/.mrconfig up
  fi

  if [[ -f $HOME/.src/.mrconfig ]] ; then
    mr -j10 -m -c $HOME/.src/.mrconfig up
  fi

  if [[ -f $HOME/.bin/vcsh ]] ; then
    curl -fsLS https://github.com/RichiH/vcsh/releases/latest/download/vcsh-standalone.sh > $HOME/.bin/vcsh
    chmod +x $HOME/.bin/vcsh
  fi

  echo
  echo "# Running update commands for ${machine}"
  echo

  if [[ ${machine} == "Mac" ]] ; then
    brew update
    brew update --cask
    brew upgrade
    asdf plugin update --all
    gcloud components update -q
  fi

  if [[ ${machine} == "Linux" ]] ; then
    sudo apt-get update
    sudo apt-get upgrade -y
    sudo apt-get autoremove -y
  fi

  if command -v docker &> /dev/null && docker ps &> /dev/null ; then

    echo
    echo "# Updating Docker Containers via Watchtower"
    echo

    docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /etc/localtime:/etc/localtime:ro containrrr/watchtower --run-once 2>&1
    docker system prune -af --volumes
  fi

  echo
  echo "# Oh-My-ZSH"
  echo

  omz update -y

}
