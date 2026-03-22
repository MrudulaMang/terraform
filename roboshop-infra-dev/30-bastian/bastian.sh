#!/bin/bash
# we ar creating 50gb root volume only 20 gb is partioned, 
# remaining 30gb is extended using below commands
growpart /dev/nvme0n1 4 #grow full size
pvresize /dev/nvme0n1p4 #i wrote cpz lvextend may fail
lvextend -r -L +30G /dev/mapper/RootVG-homeVol
# xfx_growfs /home ----no need to use this command when using -r in the above

yum install -y yum-utils 
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
yum -y install terraform
