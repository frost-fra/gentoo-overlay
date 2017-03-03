This is my gentoo-overlay repository
Here I will oranize all my personal ebuilds
for software packages which are not available
as native Gentoo ebuilds

To use the ebuilds, create a file frost-fra
in the /usr/etc/portage/repos.conf/ directory
and insert the following lines:
[frost-fra]
location = /usr/local/overlay/frost-fra
sync-type = git
sync-uri = https://github.com/frost-fra/gentoo-overlay.git
auto-sync = yes
