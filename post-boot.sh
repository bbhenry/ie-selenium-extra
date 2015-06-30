#!/bin/bash

#set -x
#set -e

# Updates all Vagrant machines based on modernie to run selenium

for ID in {8..11}; do
  if [[ $(VBoxManage list vms | grep "IE${ID}_Win7") ]]; then
    $(dirname $0)/post-boot-machine.sh IE${ID}_Win7 || exit 1
  fi
done
