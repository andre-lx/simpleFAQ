# simpleFAQ

SimpleFAQ is the most basic CLI help assistant for any job you are currently working on. Completely simple and adjustable for your needs. You can write anything using vim, such as commands, procedures, tasks, or even specify docs for specific actions.

The services folder can be used for anything. You can write a service that is docker, or linux, but you can also use for a project, framework, config parameters, etc...
 
**The services present in the project are just to show you how you can organize your services files.**
 
## Installation

#### Download

```
git clone https://github.com/andre-lx/simpleFAQ
```

#### Add alias

Use this to run the script as 'fq ls' , 'fq docker edit', .... and to run the script from everywhere, instead of typing always 'source simplefaq.sh ls', 'source simplefaq.sh docker edit'

1 - add this to the file "~/.bashrc" if it's not present:
```
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
```

2 - add alias to ~/.bash_aliases with the correct path:
```
alias fq='source ~/Documents/simpleFAQ/simplefaq.sh'
```

3 - run bashrc to update alias
```
source ~/.bashrc
```

If you don't want to use fq alias, use the script as: 

```
source simplefaq.sh help 
```

## Usage

The easiest way to use the project is to have always an open cli window just for the faq.

Help
```
fq
or
fq help

output:
		fq help - this view
		fq dir DIR - set services dir
   		fq SERVICE - view service faq
        	fq SERVICE new - open new service on vim 
   	 	fq SERVICE edit - open existing service on vim
   		fq SERVICE rm - remove service if exists
   	 	fq ls - list service files
	
		---
		services dir: ~/Documents/simpleFAQ/services_example
```

Config services path - default is the services_example folder:
```
fq dir ~/Documents/simpleFAQ/services_example
```

List all existent services (files in services folder)
```
fq ls

output:
    aws ceph docker docker-compose farm git linux scar ssh

```

Open specific service. Example: docker service file
```
fq docker

output:
    #SSH TO CONTAINER
    docker exec -it <container_id> /bin/bash

```

Edit existent service. This will open the file in vim. Example: edit docker service 
```
fq docker edit
```

Create new service. This will open the file in vim. Example: new docker2 service

```
fq docker2 new
```

Remove service. **This will delete the file.** Example: remove docker2 service

```
fq docker2 rm
```

Search on services:

```
fq docker | grep exec

output:
    docker exec -it <container_id> /bin/bash
```

Assuming that you use one specific CLI window only for the faq and since the program always clear the window you can easily search using the search present in the CLI.

## Contributing

The biggest goal of the project is all about simplicity. Easy to check and fast to edit.

Any ideias, please let me know. 

Open an issue to help in any way.
