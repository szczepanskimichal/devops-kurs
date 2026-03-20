#!/bin/bash

mkdir -p ~/backup

cp -r "$1" ~/backup/

echo "Backup completed: $1"
