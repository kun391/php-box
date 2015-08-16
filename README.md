# A Virtual Machine for Development

## Requirements

* [VirtualBox](https://www.virtualbox.org)
* [Vagrant](http://vagrantup.com)

## How To Build The Virtual Machine

Building the virtual machine is this easy:

```sh
host $ git clone https://github.com/rails/rails-dev-box.git
host $ cd rails-dev-box
host $ vagrant up
```

That's it.

After the installation has finished, you can access the virtual machine with

```sh
host $ vagrant ssh
```

## What's In The Box

* Git
* PHP 5.6
* Apache 2
* SQLite3, MySql
* Nodejs, NPM
* [Yeoman](http://yeoman.io/)
