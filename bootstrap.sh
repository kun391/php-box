# The output of all these installation steps is noisy. With this utility
# the progress report is nice and concise.
function install {
    echo installing $1
    shift
    apt-get -y install "$@" >/dev/null 2>&1
}

echo updating package information
apt-add-repository -y ppa:ondrej/php5-5.6 >/dev/null 2>&1
apt-get -y update >/dev/null 2>&1

# install tools
install Git git

# install PHP and Apache
install PHP apache2 php5 libapache2-mod-php5
install PHP-Extensions php5-mysql php5-curl php5-gd php5-intl php-pear php5-imagick php5-imap php5-mcrypt php5-memcache php5-ps php5-pspell php5-recode php5-sqlite php5-tidy php5-xmlrpc php5-xsl

# install webmin
install Webmin perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python
rm webmin_1.760_all.deb 2>&1
wget http://prdownloads.sourceforge.net/webadmin/webmin_1.760_all.deb 2>&1
dpkg --install webmin_1.760_all.deb 2>&1

# install databases
install SQLite sqlite3 libsqlite3-dev

debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
install MySQL mysql-server mysql-client

# install node & npm & yeoman
install Node nodejs nodejs-legacy npm
npm install --global npm@latest
npm install -g grunt-cli bower yo generator-karma generator-angular
chmod g+rwx /root /root/.config /root/.config/configstore

# Needed for docs generation.
update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8

echo 'all set, rock on!'
