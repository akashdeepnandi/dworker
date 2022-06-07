FROM ubuntu:22.04

# Add timezone
ENV TZ="Asia/Kolkata"
ENV DEBIAN_FRONTEND=noninteractive

RUN yes | unminimize && \
    apt-get -y --no-install-recommends upgrade && \
    apt-get install -y \
        apt-utils \
        build-essential \
        software-properties-common \
        apt-transport-https \
        ca-certificates \
        man-db \
        curl \
        && \
    apt-get install -y --no-install-recommends \
        vim tmux dialog perl python3 git jq sudo shellcheck \
        tree nmap ed bc iputils-ping bind9-dnsutils htop stow unzip\
        libncurses5 libcurses-perl net-tools ssh sshpass sshfs rsync \
        cifs-utils smbclient bash-completion make wget less zsh tzdata python3-pip\
        && \
    cpan -I Term::Animation

RUN cat '/usr/share/zoneinfo/Asia/Calcutta' > /etc/localtime
RUN useradd -ms /bin/bash workspace && usermod -aG sudo workspace
RUN echo 'workspace:newpassword' | chpasswd
RUN echo 'workspace ALL=(ALL) NOPASSWD: ALL' >>  /etc/sudoers
USER workspace
WORKDIR /home/workspace
# Copying them separate make the installs cache, each scripts does different install
# Scripts have been segmented considering which takes most time and whose version change will impact
COPY --chown=workspace ./setup.sh ./
RUN chmod +x ./setup.sh && ./setup.sh
COPY --chown=workspace ./nvim-setup.sh ./
RUN chmod +x ./nvim-setup.sh && ./nvim-setup.sh
COPY --chown=workspace ./exa-setup.sh ./
RUN chmod +x ./exa-setup.sh && ./exa-setup.sh
# COPY --chown=workspace ./node-setup.sh ./
# RUN chmod +x ./node-setup.sh && ./node-setup.sh
COPY --chown=workspace ./prompt-setup.sh ./
RUN chmod +x ./prompt-setup.sh && ./prompt-setup.sh
COPY --chown=workspace ./entrypoint.sh ./
RUN chmod +x ./entrypoint.sh
COPY --chown=workspace ./node-setup.sh ./
RUN chmod +x ./node-setup.sh
# ENTRYPOINT ["./entrypoint.sh"]
CMD tail -f /dev/null



