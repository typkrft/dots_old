# Free BSD Notes

## Update Pkgs from Quarterly to Latest
in `/etc/pkg/FreeBSD.conf` add

```
FreeBSD: {
  url: "pkg+http://pkg.FreeBSD.org/${ABI}/latest",
  mirror_type: "srv",
  signature_type: "fingerprints",
  fingerprints: "/usr/share/keys/pkg",
  enabled: yes
}
```
then update and upgrade

## Fix colorls
if colorls is trying to exec itself in the current directory set the path

in `~/.asdf/shims/colorls`

```
#!/usr/bin/env bash
# asdf-plugin: ruby 3.1.0
exec $HOME/.asdf/bin/asdf exec "colorls" "$@"
```
