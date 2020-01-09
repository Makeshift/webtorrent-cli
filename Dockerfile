FROM ubuntu:latest
# I wanted to use Alpine but couldn't get nss-mdns compiled on it
# If somebody manages that, please let me know!

WORKDIR /app

COPY . .

RUN apt-get update && \
    apt-get install -y apt-utils debconf-utils dialog curl bash git && \
    echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
    echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections && \
    curl -sL https://deb.nodesource.com/setup_13.x | bash - && \
    apt-get install avahi-daemon avahi-dnsconfd avahi-utils nodejs -y && \
    mkdir -p /var/run/dbus && \
    npm install && \
    chmod +x wrapper.sh

EXPOSE 8000
# dbus-daemon --config-file=/usr/share/dbus-1/system.conf --print-address
# avahi-daemon
# avahi-dnsconfd
# ping dcd5833b-a358-6208-2310-9b793a9d86f2.local
#CMD ["/bin/bash"]
ENTRYPOINT ["/bin/bash", "/app/wrapper.sh"]