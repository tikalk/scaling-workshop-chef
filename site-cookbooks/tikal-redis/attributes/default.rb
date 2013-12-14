# Unfortunately Redis don't maintain their own stable debian builds
# Chris Lea maintains several built projects and considered trustworthy
# https://launchpad.net/~chris-lea/+archive/redis-server
#
# Warning: The PPA might change the version name when Chris feels like it ...

default['redis']['version'] = "2:2.8.2-1chl1~#{node['lsb']['codename']}1"
default['redis']['apt']['uri'] = 'http://ppa.launchpad.net/chris-lea/redis-server/ubuntu'
default['redis']['apt']['key'] = 'C7917B12'
