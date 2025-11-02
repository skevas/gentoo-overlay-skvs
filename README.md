# Howto use this repo

## Variant 1: RTFM

[Portage with Git](https://wiki.gentoo.org/wiki/Portage_with_Git)

## Variant 2

Edit ```/etc/portage/repos.conf/local.conf``` and add

```
[skevas-overlay]
location = /var/db/repos/skevas-overlay
sync-type = git
sync-uri = https://github.com/skevas/gentoo-overlay-skvs.git
auto-sync = yes
priority = 50
```


