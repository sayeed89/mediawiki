#Launching instances

resource "aws_instance" "mediawiki-node" {
        ami = "${var.ami}"
        instance_type = "${var.instance_type}"
        key_name = "${var.key}"
        subnet_id = aws_subnet.mediawiki-subnet.id
        vpc_security_group_ids = [
                        aws_security_group.mediawiki-security-group.id,
        ]
        associate_public_ip_address = "true"

        root_block_device {
                delete_on_termination = "true"
                volume_size = "8"
                volume_type = "gp2"
        }

        tags = {
                Name = "MediaWiki-Node"
                Server = "MediaWiki"
        }
}

output "MediaWiki_IP" {
        value = "${aws_instance.mediawiki-node.private_ip}"
}
