# base cookbook

One cookbook to rule them all...

Basic config for all the machines. This is where we put things that
we expect to have on all the machines.

This cookbook was created with `berks cookbook base --vagrant --git
--foodcritic -L mit -m "Jonas Pfenniger" -e jonas@pfenniger.name` and then
adapted.

Verification of the cookbook's structure is done by running
`thor foodcritic:lint`.

Testing of the cookbook is done by running `vagrant up`

The "./bootstrap" file might act as an example on how to initialize the
boxes.

# Requirements

Platform
--------

* Ubuntu Precise

Cookbooks
---------

The following Opscode cookbooks are dependencies:

* build-essential
* git
* logrotate
* motd-tail
* openssh
* python

# Usage

Put base:default it as first include in all runs.

# Attributes

None yet

# Recipes

default
-------

hostname
--------

Sets the machine's hostname to `node[:machine_base][:hostname]` or use
some sane defaults.

# Author

Author:: Jonas Pfenniger <jonas@pfenniger.name>

Copyright 2013, Jonas Pfenniger.
