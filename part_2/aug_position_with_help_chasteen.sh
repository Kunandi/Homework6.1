 #Write a shell script that takes 3 arguments and prints them in reverse order. If -h is entered anywhere a short help description should be printed as well.
#!/bin/bash
read -p "enter first input" one
if [ ${one} = "-h" ]; then
   printf "this is a simple program, enter a string for each prompt then it will spit it out in reverse order"
   read -p "press enter to continue"
   read -p "enter first input" one
else
echo “First input is ” ${one}
fi
read -p "enter second input" two
if [ ${two} = "-h" ]; then
   printf "this is a simple program, enter a string for each prompt then it will spit it out in reverse order"
   read -p "press enter to continue"
   read -p "enter second input" two
echo “Second input is ” ${two}
fi
read -p "enter third input" three
if [ ${three} = "-h" ]; then
   printf "this is a simple program, enter a string for each prompt then it will spit it out in reverse order"
   read -p "press enter to continue"
   read -p "enter third input" three
echo “Third input is ” ${three}
fi

printf "\n\n\n Now the order is ${three}, ${two}, ${one}\n\n\n"
