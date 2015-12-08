Setup PHP environment with Vagrant on Windows.
-------------

## Requirements

* [Virtual Box](https://www.virtualbox.org)
* [Vagrant](http://vagrantup.com)
* [Git](https://git-scm.com)

### Step 1 - Download Virtual Box and install
  * Go to the [link](https://www.virtualbox.org/wiki/Downloads) and download version compatible with OS

### Step 2 - Download Vagrant and install
  * Go to the [link](https://www.vagrantup.com/downloads.html) and download version compatible with OS

### Step 3 - Download Git and install
  * Go to the [link](https://git-scm.com/download/win) and download version compatible with OS

> *Note*: After the installation has finished, you should restart machine.

## Step 4 - Setup Virtual Machine

Run code on CMD's windows or Git bash

```
host$ git clone https://github.com/kun391/php-box.git
host$ cd php-box
```

**Config Vagrantfile**

In folder php-box we have file Vagrantfile. Open and edit it.

__If you use OS 32bit you should use box 32bit. Default: 64bit__

```
# config.vm.box      = 'ubuntu/trusty64'
config.vm.box        = 'ubuntu/trusty32'
# config.vm.box      = 'path/to/the/box'
```

__If you has a box, you can use the path to install__

```
# config.vm.box      = 'ubuntu/trusty64'
# config.vm.box      = 'ubuntu/trusty32'
config.vm.box        = 'path/to/the/box'
```

- Others:

__If you want to sync folder between windows and virtual machine. You can change__

```
# config.vm.synced_folder "/home/sources", "/var/www"
```
to

```
config.vm.synced_folder "/home/sources", "/var/www"
```

> *__Note__*: "/home/sources" is the path on windows and "/var/www" is path on virtual machine

__You can upgrade for virtual machine by remove # on the code__

```
# config.vm.provider "virtualbox" do |vb|
#   vb.gui = true
#   vb.memory = "1024"
# end
```

Finally, run the code on CMD's windows or Git bash:

```sh
host$ vagrant up
```

### Step 4 - Configuration Virtual Host

SSH to Virtual Manchine
```
host$ vagrant ssh
host$ sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/virtualconfig.com.conf
host$ vim /etc/apache2/sites-available/virtualconfig.com.conf
```

Insert to file
```
<VirtualHost *:80>
DocumentRoot /var/www/theright
<Directory /var/www/theright>
       Options Indexes FollowSymLinks MultiViews
       AllowOverride All
       Order allow,deny
       allow from all
</Directory>
ServerName virtualconfig.com
</VirtualHost>
```

> **Note:** You can learn more config on [Apache Docs](https://httpd.apache.org/docs/2.2/en/vhosts/)

Then restart apache
```
host$ service apache2 restart
```

Add server name
```
127.0.0.1 virtualconfig.com
```
to file hosts on windwows:
> *C:\Windows\System32\drivers\etc*

 and run virtualconfig.com on browser to view result.

## What's In The Box

* Git
* PHP 5.6
* Composer
* Apache 2
* SQLite3, MySql
* Webmin
