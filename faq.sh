#!/bin/bash

source $(dirname $0)/simplefaq.cfg

clear

echo -e '\e[32m'
if [ "$1" == "help" ] || [ "$1" == "" ]; then
   echo "		faq help - this view
   		faq SERVICE - view service faq
                faq SERVICE new - open new service on vim 
   	 	faq SERVICE edit - open existing service on vim
   		faq SERVICE rm - remove service if exists
   	 	faq ls - list service files"
   echo -e '\e[0m'
   exit
elif [ "$1" == "ls" ]; then
   ls $servicespath/
   echo -e '\e[0'
   exit
fi

if [ -e $servicespath/$1 ];
then
   if [ "$2" == "edit" ]; then
      vi $servicespath/$1
   elif [ "$2" == "new" ]; then   
      echo -e "\e[31mService already on faq! \nEdit service with 'faq serviceName edit' \e[0m"
   elif [ "$2" == "rm" ]; then
      rm $servicespath/$1
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

echo "
Available services:"
ls $servicespath/

echo -e '\e[0m'
