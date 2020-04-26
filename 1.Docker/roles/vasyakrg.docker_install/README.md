docker
======
This Ansible role enables people to install the latest Docker on an Ubuntu-like
system. It also provides a handy library function to validate that the Docker
daemon is running and functional.

Requirements
------------

This role will only work on an Ubuntu-like system.

Role Variables
--------------

```yaml
# Any additional docker service options
# Example: '--dns 8.8.8.8 --dns 8.8.4.4 --userns-remap=default'
# docker_additional_service_opts: |
#   {
#     "userns-remap": "default",
#     "dns": [
#       "8.8.8.8",
#       "8.8.4.4"
#     ]
#   }
docker_additional_service_opts: |
  {}
```

Examples
--------

Install this module from Ansible Galaxy into the './roles' directory:
```bash
- name: vasyakrg.docker_install
  src: git+https://github.com/vasyakrg/docker_install.git
  version: origin/master
```

Use it in a playbook as follows:
```yaml
- hosts: all
  roles:
    - role: vasyakrg.docker_install
      tags: docker
      become: true

  vars:
    docker_user: "vasyansk"
    docker_additional_service_opts: |
      {
        "exec-opts": ["native.cgroupdriver=systemd"],
        "log-driver": "json-file",
        "log-opts": {
          "max-size": "100m"
        },
        "storage-driver": "overlay2"
      }
```
