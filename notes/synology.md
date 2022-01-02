# When Docker Stalls (Usually after a restart)
## To Stop a service 
- `sudo synoservice --hard-disable pkgctl-Docker`
## Kill all docker services 
- `sudo killall -KILL docker`
  - docker 
  - dockerd 
  - containerd-shim-runc-v2
## Change all restart policies if needed
- hostconfig.json contains the restart policy and is stored in hashed folders located at `/var/packages/Docker/target/docker/containers/`
  - NOTE: You will need to sudo each command as this is a protected directory or `sudo -i`
## Wrap Up
- Once done you can renable docker services
- Some Containers my not work delete them with `sudo docker rm` then rerun docker-compose on the stack 

