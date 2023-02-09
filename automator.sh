#!/bin/bash

if [ $#  -ne 2  ] #test if number of arguments is 2
then #if number of arguments not equal to 2, show error message and exit script
	echo -e "Opps! Invalid umber of arguments issued \nUsage: ./outomater <string> <file_name(one word long)>"
exit 1
else #otherwise create file and write into it

	echo -e "#!/bin/bash\n$1" > $2
	chmod u+x $2
#ask if want to commit and pus changes
echo "Do you want to commit and push now: Y/N"
read do_commit
	if [[ $do_commit  == "Y" || $do_commit == "y" ]]
	then #if yes ask for commit message, commit and push to github
		echo "Enter commit message"
		read c_m
		git add . && git commit -m "$c_m" && git push
		exit 1
	else #if no dispaly created name in message and end script
		echo -e "file $2 was created successfully\nGood Bye!"
	fi
fi
