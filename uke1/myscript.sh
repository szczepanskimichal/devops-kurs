#!/bin/bash

command=htop

if -v $command
then
	echo $"sommand is available, let's run it..."
else
	echo $"sommand is NOT available, installing it..."
	sudo apt update && sudo apt install -y htop $command
fi
$command
