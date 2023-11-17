###############################################################
#Cloudshell - https://cloud.google.com/shell/docs/quickstart
1. Install asciinema by running (for Ubuntu):

sudo apt-get install asciinema

2. Start recording the terminal session by running and following the prompts:

asciinema rec

3. Run the steps to init container specification:

cd ~
mkdir -p demo/rootfs
cd demo/
docker run busybox
docker ps -a
#Export a containers filesystem as a tar archive
docker export 2b7f4b2010f1 |tar xf - -C rootfs
#unshare -i -m -n -p -u -U --mount-proc -R rootfs -f sh
runc spec

nano config.json
 "terminal": false,
 "args": [
         "sh",
         "-c", "while true; do { echo -e 'HTTP/1.1 200 OK\n\n Version 1.0.0';} | nc -vlp 8080; done"
         ],
 "namespaces": [
         {
                 "type": "network",
                 "path": "/var/run/netns/runc"
         },

4. Add network configuration for your container spec file

sudo ip netns add runc
ls -l /var/run/netns
ip netns list

#sudo ip netns delete runc

sudo bash

#sudo runc run demo
#open new tab and kill the process - sudo runc kill demo SIGKILL

brctl addbr runc0
ip link set runc0 up
ip addr add 192.168.0.1/24 dev runc0
ip link add name veth-host type veth peer name veth-guest
ip link set veth-host up

brctl addif runc0 veth-host
ip link set veth-guest netns runc

ip netns exec runc ip link set veth-guest name eth1
ip netns exec runc ip addr add 192.168.0.2/24 dev eth1
ip netns exec runc ip link set eth1 up
ip netns exec runc ip route add default via 192.168.0.1
ping 192.168.0.2

Ctrl+D

sudo runc run demo
#open new tab and - curl 192.168.0.2:8080; sudo runc kill demo SIGKILL
Ctrl+D

sudo runc run demo
Ctrl+C
Ctrl+D
