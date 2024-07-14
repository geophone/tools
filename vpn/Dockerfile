FROM ubuntu
RUN apt-get update && apt-get install openvpn easy-rsa -y
COPY vars /usr/share/easy-rsa/

WORKDIR /usr/share/easy-rsa/
RUN ./easyrsa init-pki
RUN ./easyrsa --batch build-ca nopass
RUN ./easyrsa --batch gen-req server nopass
RUN ./easyrsa --batch sign-req server server
RUN ./easyrsa gen-dh
RUN ./easyrsa --batch gen-req client1 nopass
RUN ./easyrsa --batch sign-req client client1
RUN openvpn --genkey --secret ta.key
RUN cp pki/ca.crt pki/issued/server.crt pki/private/server.key pki/dh.pem ta.key /etc/openvpn/

COPY server.conf /etc/openvpn/
RUN mkdir -p /dev/net && mknod /dev/net/tun c 10 200 && chmod 600 /dev/net/tun
WORKDIR /etc/openvpn/
ENTRYPOINT /usr/sbin/openvpn --config /etc/openvpn/server.conf

#to run docker run --name vpn --privileged --cap-add=NET_ADMIN --device /dev/net/tun -it vpn
#docker cp vpn:/usr/share/easy-rsa/pki/issued/client1.crt .