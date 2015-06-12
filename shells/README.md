# shells
temporary/backup shell scripts for open source projects

under vagrant directory create two subdirs:
-files
-shells

Vagrant will take provisioning scripts from shells folder. Guest machine executing script will take .deb files from
files folder which is automatically shared with host by default. Look for /vagrant - to see shared files.

This is to speed up installation process by caching GO files offline. Makes sense for go-server only though. I did it for client 
for consistency. 

With sheff/puppet - caching is done by the tool itsels.
