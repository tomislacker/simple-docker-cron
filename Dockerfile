FROM        debian:jessie
MAINTAINER  Ben Tomasik <btomasik@telkonet.com>

RUN         apt-get update -qq \
                && apt-get upgrade -qq

