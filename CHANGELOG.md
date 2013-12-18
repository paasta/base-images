
0.4.0 / 2013-12-18 
==================

 * Updates chef to 11.8.2
 * Use the latest Ubuntu precise 64 AMIs
 * Updates the base cookbook to v0.4.0
 * Fixes EC2 instance bundle upload with the new packer 0.4.1
 * Remove old cloud-init info
 * Better build instructions
 * ./ami destroy fixes
 * Simplify the cloud-init script

0.3.0 / 2013-10-28 
==================

 * Use base cookbook v0.3.0
 * Switch to using Librarian-chef instead of Berkshelf
 * Publish the amis separately
 * Make sure AMIs are up to date
 * Update build script to always run `make` before and ensure a consistent state.
 * Remove unused Vagrantfile
 * Cookbooks updates
 * Fixes missing /etc/apt/trusted.gpg
 * Reorder the template keys in a meaninful order
 * README.md update
 * Scrub the disks on EBS
 * Maintain the template in YAML format. Much more human-friendly.
 * Fixes double AMI release in us-east-1

0.1.0 / 2013-10-23 
==================

Initial release on AWS and VirtualBox.

