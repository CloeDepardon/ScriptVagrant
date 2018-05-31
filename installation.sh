#!/usr/bin/env bash

COLOR='\033[1;34m'
NC='\033[0m' # No Color

echo -e "${COLOR}Installation des packages..${NC}"
echo -e "${COLOR}Installation de Apache 2 ${NC}"
sleep 2
sudo apt-get -y install apache2
echo -e "${COLOR}Installation de PHP 7 ${NC}"
sleep 2
sudo apt-get -y install php7.0
sudo apt-get -y install php7.0-mysql
sudo apt-get -y install libapache2-mod-php7.0
echo -e "${COLOR}Installation de My SQL Server ${NC}"
sleep 1
read -sp "Choisissez un mot de passe :" mdpSql
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $mdpSql"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $mdpSql"
sudo apt-get -y install mysql-server
sleep 2
exit
echo -e "${COLOR}Installation terminée ! Votre Vagrant est désormais fonctionnelle.${NC}"
echo -e "${COLOR}Vous pouvez y accéder à l'IP suivante : 192.168.33.10 ${NC}"

