Working with Vagrant, Ansible, and Docker
=========================================

This is a demo project using Vagrant, Ansbile and Docker. An Ansible playbook is used to build a Docker image, and then start a Docker container. The Docker container runs a Django app which is executed within the Vagrant VM.

Required Software
-----------------
* Vagrant
* virtualenv (optional)
* pip

Up and running
--------------

```

virtualenv env --no-site-packages

source env/bin/activate

pip install -r requirements.txt

ansible-galaxy install angstwad.docker_ubuntu

vagrant up

```

[http://localhost:8000](http://localhost:8000)

![Image of Django]
(http://oi62.tinypic.com/2yjubly.jpg)
