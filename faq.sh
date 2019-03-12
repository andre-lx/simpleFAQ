#!/bin/bash

source simplefaq.cfg

clear

echo -e '\e[32m'
if [ "$1" == "help" ] || [ "$1" == "" ]; then
   echo "		faq help - this view
   		faq SERVICE - view service faq
   	 	faq SERVICE edit - open existing service on vim
   		faq SERVICE new - open new service on vim
   	 	faq ls - list service files"
   echo -e '\e[0m'
   exit
elif [ "$1" == "ls" ]; then
   ls $servicespath/
   echo -e '\e[0m'
   exit
fi

if [ -e $servicespath/$1 ];
then
   if [ "$2" == "edit" ]; then
      vi $servicespath/$1
   elif [ "$2" == "new" ]; then   
      echo -e "\e[31mService already on faq! \nEdit service with 'faq serviceName edit' \e[0m"
   else
      cat $servicespath/$1
   fi
else
   if [ "$2" == "new" ]; then
      vi $servicespath/$1
   else
      echo -e "\e[31mService not found on faq! \nCreate new service with 'faq serviceName new' \e[0m"
   fi
fi
echo -e '\e[0m'

