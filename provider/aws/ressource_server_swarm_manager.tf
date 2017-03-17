resource "aws_instance" "swarm_manager" {
  instance_type = "${var.aws_type_manager}"
  ami = "${var.aws_ami}"
  associate_public_ip_address = true
  key_name = "${var.aws_key_name}"
  security_groups = ["${aws_security_group.swarm.name}"]

/*  provisioner "local-exec" {
    command = "sleep 60 && ansible-playbook -i '${self.public_ip},' --private-key ${var.aws_ssh_key}  '../../ansible/swarm_manager.ansible.yaml' -T 300 --user=ubuntu"
  }*/

  tags {
    Name = "swarm_manager"
  }
}