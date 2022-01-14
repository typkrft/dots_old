# Dots

# Install

# Features

# Issues
- Likely something in my nv_chad/custom is breaking to resolve comment out lazy load command in ~/.config/nvim/lua/plugins/init.lua 
- Add `tag = 'v0.3.3'` to feline plugin in ~/.config/nvim/lua/plugins/init.lua
- Install Devicons after ranger `git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons`
- Take some notes on how I've current got NFS shares setup RE: permissions in Truenas and compose, as well as the optiosn in the compose file Look into best practices
- Take some notes on system files I've changed like etc/resolv.conf and sshd_config, the changes I made and why ( what problem I was having )

# Docker
## GPU
[Nvidia](https://github.com/docker/compose/issues/6691)
[Ubuntu Nvidia](https://github.com/ubuntu/microk8s/issues/2662)
[Debian Nvidia](https://github.com/NVIDIA/nvidia-docker/issues/1447)
[SO maybe not helpful](https://askubuntu.com/questions/1294762/cant-run-nvidia-docker)
[NVIDIA](https://github.com/NVIDIA/nvidia-docker/issues/1225)
[Not sure if helpful](https://www.reddit.com/r/qnap/comments/k9yznh/guide_plex_hardware_transcode_with_docker_and_gpu/)

## NFS
[Example and info on options](https://stackoverflow.com/questions/45282608/how-to-directly-mount-nfs-share-volume-in-container-using-docker-compose-v3)
[Another Example](https://blog.stefandroid.com/2021/03/03/mount-nfs-share-in-docker-compose.html)
[Another Example](https://lefthandbrain.com/mounting-nfs-volumes-with-docker-compose/)
[RE: Permssions](https://www.truenas.com/community/threads/nfs-mount-configuration-for-user-perms.70236/post-484765)
[RE: Permissions](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/4/html/security_guide/s2-server-nfs-noroot)

# Networking
[resolv.conf](https://askubuntu.com/questions/1257384/how-do-resolv-conf-and-linux-dns-work)

## How to install 

```
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | \
  sudo apt-key add -
distribution=$(. /etc/os-release;echo ${ID}20.10)
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
  sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update
```

# TODOs
## [starship/starship.toml](starship/starship.toml)
- [ ] ( __Line: 1__) - Add Time that Displays after 2200
- [ ] ( __Line: 2__) - Add Music if playing
- [ ] ( __Line: 3__) - See if I can make the prompt a color script gradient changes on error

## [nv_chad/init.lua](nv_chad/init.lua)
- [ ] ( __Line: 36__) - Add Events to plugs to lazy load

## [nv_chad/highlights.lua](nv_chad/highlights.lua)
- [ ] ( __Line: 10__) - Should add a check for Dracula before setting these 

## [install.conf.yaml](install.conf.yaml)
- [ ] ( __Line: 1__) - Install Pip, Go, Rust, Node, etc Packages
- [ ] ( __Line: 2__) - Add packages from comm -23 <(pacman -Qqett | sort) <(pacman -Qqg base -g base-devel | sort | uniq) to archinstall json
- [ ] ( __Line: 3__) - add yay packages to arch install json
- [ ] ( __Line: 4__) - change to zsh by default
- [ ] ( __Line: 5__) - Get a clipboard manager
- [ ] ( __Line: 6__) - Setup git user.name and user.email if not set
- [ ] ( __Line: 7__) - Install Homebrew
- [ ] ( __Line: 8__) - Look for Git Repo Download Manager, Create Code/Git Folder
- [ ] ( __Line: 9__) - Add Firefox Profile
- [ ] ( __Line: 10__) - Setup asdf
- [ ] ( __Line: 11__) - Follow neccessary instructions for installed brew packages
- [ ] ( __Line: 12__) - Create Install Script that sets Env Variables then check env variables to link specific files
- [ ] ( __Line: 13__) - Setup macos file to run once Maybe set an EVN variable in zshrc
- [ ] ( __Line: 14__) - Download and install https://ftp.epson.com/drivers/ES400_Lite_64NR_AM.dmg for the scanner
- [ ] ( __Line: 15__) - Download Kitty Repo so it can be liked to head in kitty.conf 
- [ ] ( __Line: 16__) - Setup and Add Start Page (Awesome Startpage Rrpo)
- [ ] ( __Line: 17__) - Install packages first before linking 
- [ ] ( __Line: 18__) - Run nvchad install after neovim install before linking
- [ ] ( __Line: 26__) - Try linking the files not the folders so it doesn't mess up colorls
- [ ] ( __Line: 37__) - Use Shell Commands to setup Watched Directories and Triggers
- [ ] ( __Line: 50__) - Install VSCode plugins 
- [ ] ( __Line: 57__) - Setup If Needed - Maybe add script in `helper`

## [kitty/kitty.conf](kitty/kitty.conf)
- [ ] ( __Line: 1__) - Syntax Highlighting for .conf not using proper italics 
- [ ] ( __Line: 10__) - Download VictorMono and Patch it myself to see if sylistic options work
- [ ] ( __Line: 11__) - Create Symbol Map to use large VictorMono Icons and Mono as regular Font
- [ ] ( __Line: 26__) - Maybe this can be set to xterm-kitty and changed when needed for ssh etc
- [ ] ( __Line: 34__) - Setup Keyboard Shortcuts and Bindings

## [bin/helper](bin/helper)
- [ ] ( __Line: 199__) - Add flag to set all spaces to same wallpaper
- [ ] ( __Line: 200__) - Set the name of the terminal and center and float it in yabai rules
- [ ] ( __Line: 201__) - Bind key to set color scheme
- [ ] ( __Line: 202__) - Bind key to show desktop
- [ ] ( __Line: 251__) - This could be improved with imagemagick and hammerspoon 

## [i3/config](i3/config)
- [ ] ( __Line: 1__) - Add Rofi

## [notes/arch.md](notes/arch.md)
- [ ] ( __Line: 1__) - Add to install.conf.yaml 
- [ ] ( __Line: 10__) - Move Notes to GoldenAxe.local share

## [zsh/zshrc](zsh/zshrc)
- [ ] ( __Line: 1__) - Use bat for fzf
- [ ] ( __Line: 2__) - Function to search man pages with FZF and Batman https://github.com/eth-p/bat-extras/blob/master/doc/batman.md
- [ ] ( __Line: 3__) - Setup Prettier maybe alias pretty bat afterwards
- [ ] ( __Line: 4__) - Alias batdiff
- [ ] ( __Line: 5__) - Autocomplete suggestion with tab, may mess with fzf menu?
- [ ] ( __Line: 6__) - Make All Aliases check for programs if not installed by default
- [ ] ( __Line: 7__) - Create Fast Syntax Highlighting theme for Dracula
- [ ] ( __Line: 8__) - If the buffers empty set left or right arrow to ctrl + r history search
