#syntax=docker/dockerfile:1.12.1

# ----------------------------------------------------------
# Base image

ARG VERSION="3.21.0"

# https://hub.docker.com/_/alpine
FROM alpine:${VERSION}
LABEL maintainer="Kanelis Elias <e.kanelis@voidbuffer.com>"

# ----------------------------------------------------------
# Packages to install

# https://pkgs.alpinelinux.org/packages
ARG PACKAGES="bash sudo emacs-x11 git ca-certificates gpg gnutls ncurses libxpm"

RUN apk update && apk add --no-cache ${PACKAGES}

# ----------------------------------------------------------
# USER

ARG PUID="${UID:-1000}"
ARG PGID="${GID:-1000}"
ARG USERNAME="${USER:-tedi}"

# Create a new user on start
RUN addgroup -g ${PGID} ${USERNAME}
RUN adduser -u ${PUID} \
            -G ${USERNAME} \
            --shell /bin/bash \
            --disabled-password \
            -H ${USERNAME}

# Give root access to user with requiring password
RUN echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${USERNAME}

# Set the user's home
RUN mkdir -p /home/${USERNAME}
RUN chown ${USERNAME}:${USERNAME} /home/${USERNAME}
WORKDIR /home/${USERNAME}
USER ${USERNAME}

# Get emacs configs
ARG EMACS_HOME="/home/${USERNAME}/.config/emacs"
COPY --chown=${USERNAME}:${USERNAME} . ${EMACS_HOME}

# Build config
# RUN cd ${EMACS_HOME} && ./install_emacs
RUN cd ${EMACS_HOME} && ./test-startup.sh

# ----------------------------------------------------------
# Startup

ENTRYPOINT ["/bin/bash", "-l", "-c"]
CMD ["emacs"]
