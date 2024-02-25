#!/bin/bash
# Frederico Winter (2024)
# >_ fwinter


vms=$(virsh -c qemu:///system list --all | tail -n +3 | awk '{printf "%s ", $2}')
number_of_vms=$(echo vms | wc -l)

virt-viewer -c qemu:///system -- $(echo $vms | head -$number_of_vms | tr " " "\n" | wofi -d -p 'Choose the VM')
