FROM debian:buster

# Setup build environment
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update;\
    apt-get -fqqy install clamav wget sudo;

RUN groupadd -r clamscan -g 1000; \
    useradd -u 1000 -r -g clamscan -m -c "clamscan user" clamscan;

# Update definitions only on rebuild
RUN freshclam --quiet

WORKDIR /home/clamscan

USER clamscan
