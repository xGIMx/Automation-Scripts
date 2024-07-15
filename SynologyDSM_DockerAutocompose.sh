#The script automatically generate and exports a YAML file for all active containers. 
#All files are saved in a directory with the current date. 
#If necessary, add the script to the scheduler.

#!/bin/sh
#Path to backup location for YAML.
backup_dir="/volume1/docker/!autocompose"

docker pull red5d/docker-autocompose
current_time=$(date "+%d-%m-%Y")
docker ps -a --format '{{.Names}}' > containers.txt
mkdir $backup_dir/$current_time
new_backup_dir="$backup_dir/$current_time"

while IFS="" read -r p || [ -n "$p" ]
do
  docker run --rm -v /var/run/docker.sock:/var/run/docker.sock red5d/docker-autocompose $p > "$new_backup_dir/$p.yaml"
done < containers.txt
find "$new_backup_dir" -name "*.yaml" -mtime +5 -exec rm {} \;
