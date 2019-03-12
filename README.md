# simpleFAQ

SimpleFAQ is the most basic CLI help assistant for any job you are currently working on. Completely simple and adjustable for your needs. You can write anything using vim, such as commands, procedures, tasks, or even specify docs for specific actions.

The services folder can be used for anything. You can write a service that is docker, or linux, but you can also use for a project, framework, config parameters, etc...
 
**The services present in the project services folder are present only for example.**
 
## Installation

#### Download and Config

```
git clone https://github.com/andre-lx/simpleFAQ
```

Change the **simplefaq.cfg** file to your specification.

Each service of the faq are available in the /services folder.

Imagine that you download the project to your Documents folder. Change the config file to:

```
servicespath=~/Documents/simpleFAQ/services
```

#### Add alias

1 - add this to the file "~/.bashrc" if it's not present:
```
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
```

2 - add alias to ~/.bash_aliases with the correct path:
```
alias faq='~/Documents/simpleFAQ/faq.sh'
```

3 - run bashrc to update alias
```
. ~/.bashrc
```


## Usage

The easiest way to use this is to have always an open cli window just for the faq.

Help
```
faq
or
faq help

output:
       faq help - this view
       faq SERVICE - view service faq
       faq SERVICE edit - open existing service on vim
       faq SERVICE new - open new service on vim
       faq ls - list service files

```


List all existent services (files in services folder)
```
faq ls

output:
    aws ceph docker docker-compose farm git linux scar ssh

```

Open specific service. Example: service docker
```
faq docker

output:
    #SSH TO CONTAINER
    docker exec -it <container_id> /bin/bash

```

Edit existent service. This will open the file in vim. Example: service docker edit
```
faq docker edit
```

Create new service. This will open the file in vim. Example: service docker new

```
faq docker new
```

Search on services:

```
faq docker | grep exec

output:
    docker exec -it <container_id> /bin/bash
```

Assuming that you use one specific CLI window only for the faq and since the program always clear the window you can easily search using the search present in the CLI.

## Contributing

The biggest goal of the project is all about simplicity.

After a month of use it worked as expected, every day and on every project.

