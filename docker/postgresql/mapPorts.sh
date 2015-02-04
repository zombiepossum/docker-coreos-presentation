#!/bin/sh

VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port-postgresDb49155,tcp,,5432,,49155";
VBoxManage modifyvm "boot2docker-vm" --natpf1 "udp-port-postgresDb49155,udp,,5432,,49155";
