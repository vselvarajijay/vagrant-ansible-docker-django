Working with Vagrant, Ansible, and Docker
=========================================

This is a demo project using Vagrant, Ansbile and Docker. An Ansible playbook is used to build a Docker image, and then start a Docker container. The Docker container runs a Django app which is executed within the Vagrant VM.


![Image of Vagrant Environment]
(http://oi60.tinypic.com/2zqfpmt.jpg)

Vagrant
-------

```
Vagrant.configure(2) do |config|
  config.vm.box = "raring"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/raring/current/raring-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.network :forwarded_port, host: 8000, guest: 8000
  config.vm.provision "ansible" do |ansible|
    ansible.verbose = 'vvv'
    ansible.playbook = 'playbook.yml'
  end
end
```


Ansible
-------


```
---
- hosts: all
  sudo: yes
  tasks:
    - name: Upgrade VM package manager
      apt: upgrade=dist
    - name: Update package manager sources
      shell: sed -i -e 's/archive.ubuntu.com\|security.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list
    - name: Run apt-get update
      apt: update_cache=yes

- hosts: all
  sudo: yes
  roles:
    - angstwad.docker_ubuntu
  tasks:
    - name: Build Docker
      shell: docker build -t django_docker /vagrant/
    - name: Run Docker
      docker: image=django_docker ports=8000:8000
```


Docker
------

```
FROM ubuntu:14.04
RUN apt-get update
RUN apt-get install -y python-pip
RUN pip install Django
RUN django-admin startproject djangodocker
EXPOSE 8000
WORKDIR /djangodocker
CMD python manage.py runserver 0.0.0.0:8000
```


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
