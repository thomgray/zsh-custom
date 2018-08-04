function dkrk() {
    docker kill $(docker ps -q)
}

function dkrrm() {
    docker rm $(docker ps -aq)
}

function dkrrmi() {
    docker rm $(docker images -q)
}
