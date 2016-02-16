FROM        debian:jessie
MAINTAINER  Ben Tomasik <btomasik@telkonet.com>

RUN         apt-get update -qq \
                && apt-get upgrade -qq

RUN         apt-get install -qq --no-install-recommends \
                cron \
                logrotate \
                vim

# Ensure cron is allowed to run jobs
RUN         sed -i 's/^\(session\s\+required\s\+pam_loginuid\.so.*$\)/# \1/g' \
                /etc/pam.d/cron

# Setup the entrypoint of the container to launch the CRON daemon
ENTRYPOINT ["cron","-f","-L","15"]
