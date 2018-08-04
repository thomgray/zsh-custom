# Required for local Mozart development, and possibly other things as well
export DEV_CERT_PEM=/private/etc/pki/certificate.pem
export DEV_CA_PEM=/private/etc/pki/cloud-ca.pem

# MAVEN
export MAVEN_OPTS='-Xms768m -Xmx1024m -XX:MaxPermSize=256m
  -Djavax.net.ssl.keyStore=/etc/pki/cert.p12
  -Djavax.net.ssl.keyStorePassword=cert
  -Djavax.net.ssl.trustStore=/etc/pki/jssecacerts
  -Djavax.net.ssl.keyStoreType=PKCS12'

#  setting proxy in 'reith' profile
# export JAVA_PROXY_OPTS='
#   -Dhttp.proxyHost=www-cache.reith.bbc.co.uk
#   -Dhttp.proxyPort=80
#   -Dhttps.proxyHost=www-cache.reith.bbc.co.uk
#   -Dhttps.proxyPort=80
#   -Djsse.enableSNIExtension=false'

# quick start up of selenium-standalone (for morph multi-tier testing)
alias sss="selenium-standalone start"
alias java10="sdk use java 10.0.0-openjdk"
alias java8="sdk use java 8.0.161-oracle"
