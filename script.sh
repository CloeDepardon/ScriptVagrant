#!/usr/bin/env bash

COLOR='\033[1;34m'
NC='\033[0m'  #NOCOLOR

echo -e "${COLOR}Bonjour ! Bienvenue dans la création de votre machine virtuelle${NC}"

## RAJOUTER L'INSTALLATION DE VIRTUAL BOX ET VAGRANT ##

   ## CREER DOSSIER
read -p "Choisissez un nom pour le dossier qui accueillera votre vagrant :" nomVagrant

read -p "Choisissez un nom pour le dossier de synchonisation de votre Vagrant :" nomSync

## RAJOUTER PERSONNALISATION DE L'IP ET CREATION D'UN HOST ICI ##

   ## VAGRANT INIT 
optionsBox=("Ubuntu Xenial 64" "Ubuntu Xenial 64") 
echo -e "${COLOR}Choisissez une box: ${NC}"
select responseBox in "${optionsBox[@]}";do
    case ${responseBox} in
        "Ubuntu Xenial 64" ) boxChoice="xenial64";break;;
        "Ubuntu Xenial 64" ) boxChoice="xenial64";break;;
    esac
 done
 
 echo -e "${COLOR}Création et configuration du Vagrantfile en cours.... ${NC}" 
 sleep 1
 mkdir $nomVagrant
 cd $nomVagrant
 echo -e "${COLOR}Le dossier $nomVagrant a bien été créé. ${NC}"
 sleep 1
 mkdir $nomSync
 echo -e "${COLOR}Le dossier synchronisé $nomSync a bien été créé. ${NC}"
 sleep 1
 echo -e "${COLOR}Le script d'installation a bien été copié dans $nomVagrant/$nomSync ${NC}"
 sleep 1
 cp ../installation.sh ../$nomVagrant/$nomSync
 sleep 2
 vagrant init
        
    ## MODIFICATIONS VAGRANTFILE
sed -i '15s/base/ubuntu\/'"${boxChoice}"'/' Vagrantfile
sed -i '35s/#//' Vagrantfile
sed -i '46s/#//' Vagrantfile
sed -i '46s/..\/data/.\/'"${nomSync}"'/' Vagrantfile
sed -i '46s/\/vagrant_data/\/var\/www\/html/' Vagrantfile

   ## VAGRANT UP / SSH
sleep 2
vagrant up
sleep 2
echo -e "${COLOR}CONNEXION SSH EN COURS... ${NC}"
echo -e "${COLOR}Une fois connecté, merci de faire un cd /var/www/html.${NC}"
echo -e "${COLOR}Ensuite, éxécutez le script installation.sh ${NC}"
sleep 2
vagrant ssh

 
