# ----------------------------------------------------------
# Base image

ARG VERSION="3.17.2"

# https://hub.docker.com/_/alpine
FROM alpine:${VERSION}
MAINTAINER Kanelis Ilias <hkanelhs@yahoo.gr>

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
COPY --chown=${USERNAME}:${USERNAME} . /home/${USERNAME}/.emacs.d

# Build config
# RUN emacs -q --batch --eval="(load-file \"~/.emacs.d/init.el\")"
# RUN emacs -q --batch -l "~/.emacs.d/init.el" -f batch-byte-compile

# ----------------------------------------------------------
# Startup

ENTRYPOINT ["/bin/bash", "-l", "-c"]
CMD ["bash", "-i"]
