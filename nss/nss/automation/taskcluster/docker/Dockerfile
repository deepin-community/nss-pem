# Lean image for running the bulk of the NSS CI tests on taskcluster.
FROM ubuntu:bionic-20221215
LABEL maintainer="Martin Thomson <martin.thomson@gmail.com>"

RUN dpkg --add-architecture i386
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    clang \
    curl \
    g++-multilib \
    git \
    gyp \
    libxml2-utils \
    lib32z1-dev \
    linux-libc-dev:i386 \
    llvm-dev \
    locales \
    mercurial \
    ninja-build \
    pkg-config \
    sqlite3 \
    zlib1g-dev \
 && rm -rf /var/lib/apt/lists/* \
 && apt-get autoremove -y && apt-get clean -y

ENV SHELL /bin/bash
ENV USER worker
ENV LOGNAME $USER
ENV HOME /home/$USER
ENV LANG en_US.UTF-8
ENV LC_ALL $LANG
ENV HOST localhost
ENV DOMSUF localdomain

RUN locale-gen $LANG \
 && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales

RUN useradd -d $HOME -s $SHELL -m $USER
WORKDIR $HOME

# Add build and test scripts.
ADD bin $HOME/bin
RUN chmod +x $HOME/bin/*

USER $USER

# Set a default command for debugging.
CMD ["/bin/bash", "--login"]
