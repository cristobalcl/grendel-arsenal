#!/bin/bash

# prompt
#
# Author: Cristóbal Carnero Liñán
#
# Features:
#     - Show number of jobs.
#     - Shorten long paths.
#     - Show if last command ended in error.
#     - In SVN repositories indicates status.
#     - Warns when low disk for / and /home.
#
# How to install:
#     - Copy somewhere in your path.
#     - In your .bashrc add:
#         export PROMPT_COMMAND=". /path/to/prompt.sh"
#

LastError=$?

trap '' SIGINT SIGQUIT SIGTSTP

if [ $LastError -eq 0 ]
then
        ErrorStatus="\[\033[0m\]\$"
else
        ErrorStatus="\[\033[1;31m\]!\[\033[0m\]"
fi

history -a

DIR=`pwd|sed -e "s!$HOME!~!"`
if [ ${#DIR} -gt 30 ]
then
        CurDir=${DIR:0:12}...${DIR:${#DIR}-15}
else
        CurDir=$DIR
fi

if [ -d ".svn" ]
then
        #s=`svn status|grep -E '^\s*[ACDIM!?L]' 2>/dev/null`
        s=`svn status|grep -E '^\s*[ACDIM!L]' 2>/dev/null`
        if [ "$s" ]
        then
                SVN="\[\033[1;31m\]✗"
        else
                SVN="\[\033[1;32m\]✔"
        fi
else
        SVN=""
fi

thDiskHome=90
thDiskRoot=90

usedDiskHome=`df /home/ | tail -n 1 | awk '{print $5}' | cut -d% -f1`
if [ ${usedDiskHome} -gt ${thDiskHome} ]
then
        printf "\033[1;31mWarning: low disk space in /home/ (${usedDiskHome}%% used)\n"
fi

usedDiskRoot=`df / | tail -n 1 | awk '{print $5}' | cut -d% -f1`
if [ ${usedDiskRoot} -gt ${thDiskRoot} ]
then
        printf "\033[1;31mWarning: low disk space in / (${usedDiskRoot}%% used)\n"
fi

PS1="\[\033[1;34m\][\j] \u@\H \[\033[1;33m\]${CurDir}${SVN} ${ErrorStatus} "

trap - SIGINT SIGQUIT SIGTSTP
