# -*- mode: ruby -*-
# vi: set ft=ruby :

# Install openssh server
FROM ubuntu:14.04
MAINTAINER Mouhsen Ibrahim <imohsen9@gmail.com>
RUN apt-get update && apt-get install -y openssh-server && mkdir -p /var/run/sshd

# Create a user called mohsen
RUN adduser --disabled-password --gecos "" mohsen
RUN echo "mohsen ALL=(root) NOPASSWD: ALL" > /etc/sudoers.d/mohsen

# Add the public key to mohsen's authorized keys (the insecure private key exists in the repo)
RUN mkdir /home/mohsen/.ssh
RUN echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC6GhozMrZipES1kLdKq/9eECB4fGrlrryipHgbb6USY2KOoSEEdofkTig4mlRM8uoDxO190ZJc2WH2n+hV0V5TbAlnyLVE8ddNO+h+SGcEHZ1W2vHfkS5vfA/ijdOXol6ti6OE8nTFn+K5v+aM+zhlTP9XNsj6hSVC+ElCKyA/PRYHCvKsMh1ODjXpDvAassvjHHuwpInA4dSOOKTL78ZD+c0WfVzJl29XdwU7TEIpTev1TY0L4KmohGgRp8wM5yC52o5larz121ELFXpdeZRtke/UIDoK/FnQXsr/dLxQeZpiOwW9h5BV2P++ITNOX6b8XxohyQa8xAVHcsJSkh9t mohsen@mohsen-X540LA" > /home/mohsen/.ssh/authorized_keys

EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
