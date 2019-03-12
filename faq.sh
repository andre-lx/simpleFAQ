#!/bin/bash

help() {
   echo -e '\e[32m'
   echo "		faq help - this view
   		faq SERVICE - view service faq
                faq SERVICE new - open new service on vim 
   	 	faq SERVICE edit - open existing service on vim
   		faq SERVICE rm - remove service if exists
   	 	faq ls - list service files

			options
		-d <path> - base directory"
   echo -e '\e[0m'
}

while getopts ":d:" opt; do
	case $opt in
		d)
			export DIR=$OPTARG
			shift $((OPTIND-1))
			;;
		\?)
			echo "Invalid option: -$OPTARG" >&2
			;;
		:)
			echo "Option -$OPTARG requires an argument." >&2
			;;
		*)
			help
			;;
	esac
done

source $(dirname $0)/simplefaq.cfg

clear

#echo "arguments: $@"
#sleep 10

echo -e '\e[32m'
if [ "$1" == "help" ] || [ "$1" == "" ]; then
   help
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

echo -e '\e[0m'

echo -e "\e[96m
Available services:"
ls $servicespath/
echo -e '\e[0m'

