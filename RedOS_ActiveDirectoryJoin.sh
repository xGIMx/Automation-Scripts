#!/bin/bash
sleep 120
v_domain="<domain>"
v_admin="<user>"
v_pass_admin="<password>"
v_name_pc=$(date +"%Y%m%d%H%M%S")
export v_domain v_admin v_pass_admin v_name_pc
join-to-domain.sh --sk -w -y
echo "Script execution complete. Deleting script file..."
sleep 5 && rm -- "$0" &
echo "Reboot system..."
sleep 10 && reboot &
