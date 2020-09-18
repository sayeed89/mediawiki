# mediawiki
MediaWiki Installation using terraform code and ansible playbook

Task:
  Install and configure MediaWiki using Terraform with any Configuration Management tool integrated.


Step-1:
  instance.tf, This code is to create AWS-VPC, Intergateway attached to the VPC, Subnet, Security Group.
  
Step-2:
  resource.tf, This code is to launch the ec2 instance for installing the MediaWiki server.
  
Step-3:
  get_instance_ip.sh, By running this we get the instance ip of running MediaWiki Server. so that we can use it in ansible-playbook as hosts.
  
Step-3:
  mediawiki_configure.yml, This is a ansible-playbook, this is for installing and configuring the MediaWiki. As per this doc https://www.mediawiki.org/wiki/Manual:Running_MediaWiki_on_Red_Hat_Linux
