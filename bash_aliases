#!/bin/bash

## start application detached from console
## handy for starting gui applications from command line
## example: d gedit
function d()
{
    nohup $@ &>/dev/null &
}
## sudo d()
## example: sd wireshark
function sd()
{
    nohup gksudo $@ &>/dev/null &
}
complete -F _command d sd

## opens vim in a specific line
## handy when reading logs or compilation error
## example: iv main.c:19:error
function iv() {
    file=${1%%:*}
    rest=${1#*:}
    line=${rest%%:*}

	if ! [[ "${line}" =~ ^[[:digit:]]+$ ]]; then
		line=:
	fi

	if [[ ! -e ${file} ]]; then
		file=`find -name $(basename ${file}) | head -1`
	fi

    vim ${file} +${line}
}
