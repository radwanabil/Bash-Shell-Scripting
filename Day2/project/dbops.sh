
function authenticate {
	echo "Authentication.."
}

function querystudent {
	echo "Now query"
	echo -n "Enter student name to query GPA : "
	read NAME
	##We want to get line from datafile starts with NAME followed by :
	LINE=$(grep "^${NAME}:" datafile)
	if [ -z ${LINE} ]
	then
		echo "Error, student name ${NAME} not found"
	else
		GPA=$(echo ${LINE} | awk ' BEGIN { FS=":" } { print $2 } ')
		echo "GPA for ${NAME} is ${GPA}"
	fi
}

function insertstudent {
	echo "Inserting a new student"
	echo -n "Enter name : " 
	read NAME
	echo -n "Enter GPA : "
	read GPA
	### Before adding, we want to check GPA valid floating point or no
	checkFloatPoint ${GPA}
	[ ${?} -ne 0 ] && echo "${GPA} not valid" && exit 4
	echo "${NAME}:${GPA}" >> datafile
}

function deletestudent {
	echo "Deleting an existing student"
	echo -n "Enter studen to delete : "
	read NAME
	##We want to get line from datafile starts with NAME followed by :
        LINE=$(grep "^${NAME}:" datafile)
        if [ -z ${LINE} ]
        then
                echo "Error, student name ${NAME} not found"
        else
		##BEfore delete, print confirmation message to delete or no
		echo "Are you sure you want to delete? (y/n)"
		read confirmation
		if [ ${confirmation} == "y" ] 
		then
		##-v used to get lines DOES NOT contain regex
		grep -v "^${NAME}:" datafile > /tmp/datafile
		cp /tmp/datafile datafile
		rm /tmp/datafile
		fi
		else 
			return 0
        fi
}

function updatestudent {
	echo "Updating an existing student"
	echo -n "Enter student to update : "
    	read NAME
    	LINE=$(grep "^${NAME}:" datafile)
    	if [ -z ${LINE} ]
    	then
            echo "Error, student name ${NAME} not found"
    	else
        GPA=$(echo ${LINE} | awk ' BEGIN { FS=":" } { print $2 } ')
		echo "current GPA for ${NAME} is ${GPA}"
        echo -n "Enter new GPA: "
        read NEWGPA
        sed -i "s/${NAME}:${GPA}/${NAME}:${NEWGPA}/g" datafile
    fi
}
