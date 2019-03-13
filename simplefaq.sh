#!/bin/bash

help() {

   echo -e "
   \e[32m		fq help - this view
		fq dir DIR - set services dir
   		fq SERVICE - view service faq
                fq SERVICE new - open new service on vim 
   	 	fq SERVICE edit - open existing service on vim
   		fq SERVICE rm - remove service if exists
   	 	fq ls - list service files
   	 	
		---
		services dir: $SERVICESDIR

		\e[0m"
}

lsservices() {
	echo -e '\e[96m
Available services:'
		ls $SERVICESDIR
		echo -e '\e[0m'
}

clear

if [ "$SERVICESDIR" == "" ]; then
   export SERVICESDIR=$(pwd)/services_example
fi

if [ "$1" == "help" ] || [ "$1" == "" ]; then
   help
   return
elif [ "$1" == "ls" ]; then
   lsservices
   return
elif [ "$1" == "dir" ]; then
   
   if [ "$2" != "" ]; then
	export SERVICESDIR=$2
	lsservices
	return
   else
	echo -e "\n\e[31mPlease define a valid path. \e[0m
	"
	return
   fi
fi

echo -e '\e[32m'
if [ -e $SERVICESDIR/$1 ];
then
   if [ "$2" == "edit" ]; then
      vi $SERVICESDIR/$1
   elif [ "$2" == "new" ]; then   
      echo -e "\n\e[31mService already on faq! \nEdit service with 'faq serviceName edit' \e[0m"
   elif [ "$2" == "rm" ]; then
      rm $SERVICESDIR/$1
   else
      cat $SERVICESDIR/$1
   fi
   
   lsservices
else
   if [ "$2" == "new" ]; then
      vi $SERVICESDIR/$1
   else
      echo -e "\n\e[31mService not found on faq! \nCreate new service with 'faq serviceName new' \e[0m"
   fi
   
   lsservices
fi
echo -e '\e[0m'



