#!/bin/bash


# batch download all profile images of users given in stdin (in format user:name) to directory $1/$username

images_dir="$1"

[[ -z $images_dir ]] && echo "\$1 not set = output images dir" && exit 1


max_running=10

IFS=':'

while read username
do
	
	while [[ $(jobs | wc -l) -ge $max_running ]]
   	do
   		echo "Max running count reached, waiting a while..."
      	sleep 2
   	done

	echo "----------------- $username"; 
	./profile_images.sh "$username" "$images_dir/$username" & 

done
