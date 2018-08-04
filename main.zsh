# add custom completions dir to fpath
fpath=($ZSH_CUSTOM/completions $fpath)

export EDITOR=vim
export BUNDLER_EDITOR=atom

# point to brew linked opts for ssl and curl
export PATH=/usr/local/opt/openssl/bin:$PATH
export PATH=/usr/local/opt/curl/bin:$PATH

function mdcd() {
  mkdir $1 && cd $1
}

# alias to spit out ip address
alias ipaddr="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"

# perform arbitrary command every second
function periodically() {
  while true; do
    clear && bash -c $1 && sleep 1
  done
}

function edit() {
  vim $(which $1)
}
