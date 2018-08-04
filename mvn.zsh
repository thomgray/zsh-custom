mvnt() {
  mvn -Dtest="$@" -DfailIfNoTests=false test -q
}

mvni() {
  OPTS=""
  # -Dmaven.test.skip=true for skipping tests
  mvn install $OPTS
}

alias rm-backup "rm ./**/*.releaseBackup"
