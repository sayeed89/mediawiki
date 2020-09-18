#!/bin/bash

Private_ip=`aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" "Name=tag-value,Values=MediaWiki" --query 'Reservations[*].Instances[*].{Instance:PrivateIpAddress}' --output text`

#echo $Private_ip
echo "{\"MediaWiki\":\"${Private_ip}\"}"