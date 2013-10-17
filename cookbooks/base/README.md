# base cookbook

One cookbook to rule them all...

Makes sure all the systems have the same base. Used in the "base-image"
project to procuse AMIs and vagrant boxes. Your app should also include it in
case the reference image is out of date.

Verification of the cookbook's structure is done by running
`foodcritic .`

Testing of the cookbook is done by running `vagrant up`

# Requirements

Platform
--------

* Ubuntu Precise

# Usage

Put base::default it as first include_recipe in all runs.

# Author

Author:: Jonas Pfenniger <jonas@pfenniger.name>

Copyright 2013, Jonas Pfenniger.
