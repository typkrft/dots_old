# Notes
I had to tag feline for nvim and remove cmd enter from telescope in ~/.config/nvim/lua/plugins/init.lua
Had to change where asdf sources from

Try best to install linuxbrew first next time and install all deps from there where posible

cgroups systemd.unified_cgroup_hierarchy=false change boot params
or /etc/nvidia-container-runtime/config.toml cgroups = true 
this issue may only be ubuntu 20.10 server

## script that allowd me to download nvidia docker because 20.10 isn't yet supported. 

```SHELL
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
distribution=$(. /etc/os-release;echo ${ID}20.04)
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update
```
