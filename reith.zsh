LOCATION=$(networksetup -getcurrentlocation);

if [[ "$LOCATION" == "BBC On Network" ]]; then
  PROXY_URL="http://www-cache.reith.bbc.co.uk"
  PROXY_PORT="80"

  #proxy setup for terminal
  export HTTP_PROXY="$PROXY_URL:$PROXY_PORT"
  export http_proxy="$PROXY_URL:$PROXY_PORT"
  export HTTPS_PROXY="$PROXY_URL:$PROXY_PORT"
  export https_proxy="$PROXY_URL:$PROXY_PORT"

  # Causes problems with Maven, Node and NPM if enabled
  # export SOCKS_PROXY="socks-gw.reith.bbc.co.uk:1085"
  # export socks_proxy="socks-gw.reith.bbc.co.uk:1085"

  export NO_PROXY="127.0.0.1,localhost"
  export FTP_PROXY="ftp-gw.reith.bbc.co.uk:21"
  export ftp_proxy="ftp-gw.reith.bbc.co.uk:21"
  # Allows homebrew (and other things) to download via reith
  export ALL_PROXY=$HTTP_PROXY
  export JAVA_PROXY_OPTS='
    -Dhttp.proxyHost=www-cache.reith.bbc.co.uk
    -Dhttp.proxyPort=80
    -Dhttps.proxyHost=www-cache.reith.bbc.co.uk
    -Dhttps.proxyPort=80
    -Djsse.enableSNIExtension=false'

  # Proxy settings for git
  git config --global http.proxy "socks5://socks-gw.reith.bbc.co.uk:1085"

  # npm proxy settings
  npm config set proxy $HTTP_PROXY
  npm config set https-proxy $HTTP_PROXY

  # Enable ssh proxy
  /usr/bin/sed -i ".bak" "s/\#\{0,1\}\(ProxyCommand nc\)\(.*$\)/\1\2/g" ~/.ssh/config
else
  #proxy setup for terminal
  unset HTTP_PROXY
  unset http_proxy
  unset HTTPS_PROXY
  unset https_proxy

  # Causes problems with Node and NPM if enabled
  unset SOCKS_PROXY
  unset socks_proxy

  unset NO_PROXY
  unset FTP_PROXY
  unset ftp_proxy
  # Allows homebrew (and other things) to download via reith
  unset ALL_PROXY
  unset JAVA_PROXY_OPTS

  # Proxy settings for git
  git config --global --unset http.proxy

  # proxy settings for npm
  npm config delete proxy
  npm config delete https-proxy

  # unset SSH proxy
  /usr/bin/sed -i ".bak" "s/#\{0,1\}\(ProxyCommand nc\)\(.*$\)/#\1\2/g" ~/.ssh/config
fi

alias ron="source reith on"
alias roff="source reith off"
