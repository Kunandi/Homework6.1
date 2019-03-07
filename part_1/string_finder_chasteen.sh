#!/bin/bash

printf "\n\n\nString Finder 9000 V 1.0\n\n\n\n\n\n"
read -n 1 -s -r -p "Press any key to continue..."
function search() {
#entering file
printf "\n\n\n\n\n\n\n\n"
read -p "Enter desired file or directory..." filename
 while [[ -z ${filename} ]]; do
                echo "Any thing??" 
        read -p "Enter desired file or directory..." filename
done
printf "\n\n\n\n\n\n\n\n"
read -n 1 -s -r -p "Press any key to continue..."
printf "\n\n\n\n\n\n\n\n"
#Enter search term
read -p "Enter desired string..." string
 while [[ -z ${string} ]]; do
                echo "Any thing??" 
        read -p "Enter desired string..." string
done
 printf "Serching for ${string}...\n\n"

printf  "\n\n\nResults...\n\n\n"
#grepping
grep -i -w -c -l -n -r -H ${string} ${filename}  >> ${filename}_${string}_search.output
grep -c -i -w -l -n -r -H ${string} ${filename} 

}
count(){

    result= $( $("${grep -c -i -w -l -n -r -H ${string} ${filename}}"| wc -l) -eq * )
    if [ ${string} -eq 0 ]; then
        echo No match found
        exit 
    fi

    if [ $(echo "${result}"| wc -l) -eq * ]; then
        echo match found:
        echo "${result}"
    fi
}
search
count
printf "\n\n\n Search again?[y/n]: \n\n"
while read choice; do
case $choice in
     y)
      printf "\n\n\nsearching again...\n\n\n"; search
     ;;
     n)
      printf "\n\n\n exiting...\n\n\n\n"; 
      exit
     ;;
        *) echo "invalid option $choice";;
esac
done
