#!/bin/bash

#	   Tic-Tac-Toe
# +-------------------+
# | Creators :		  |
# |	 > Ananta Gupta   |
# |  > Tanmay Kedari  |
# |  > Aniket Borade  |
# +-------------------+

declare -a arr

function print()
{
	echo -e "\t       ********Tic-Tac-Toe********"
	echo -e "\t       -----Let play the Game-----"
	echo -e "\t      +---------------------------+"
	echo -e "\t      | Rules : X is for Player 1 |"
	echo -e "\t      |         O is for Player 2 |"
	echo -e "\t      +---------------------------+"
	echo ""
	echo -n -e "  \t"
	loop=$1
	while [ $loop -le 9 ]
	do
		echo -n -e "\t"
		xo=${arr[loop]}
		if [ $xo -eq 1 ]
		then
			echo -n "  X"
		elif [ $xo -eq 2 ]
		then
			echo -n "  O"
		else
			echo -n "-($loop)"
		fi
		if [ $(expr $loop % 3) -eq 0 ]
		then
			echo ""
			echo -n -e "  \t"
		fi	
		loop=`expr $loop + 1`
	done
	echo ""
}

function hcheck()
{
	#echo "hcheck"
	if [ "$1" -eq 1 -o "$1" -eq 4 -o "$1" -eq 7 ]
	then
		if [ "${arr[$(expr "$1" + 1)]}" -eq "$2" -a "${arr[$(expr "$1" + 2)]}" -eq "$2" ]
		then
			echo "1"
		fi
		elif [ "$1" -eq 3 -o "$1" -eq 6 -o "$1" -eq 9 ]
		then
			if [ "${arr[$(expr "$1" - 1)]}" -eq "$2" -a "${arr[$(expr "$1" - 2)]}" -eq "$2" ]
			then
				echo "1"
			fi
		else
			if [ "${arr[$(expr "$1" + 1) ]}" -eq "$2" -a "${arr[$(expr "$1" - 1)]}" -eq "$2" ]
			then
				echo "1"
			fi
	fi
}

function vcheck()
{
	#echo "vcheck: $1 ,$2"
	if [ "$1" -eq 1 -o "$1" -eq 2 -o "$1" -eq 3 ]
	then
		if [ "${arr[$(expr "$1" + 3)]}" -eq "$2" -a "${arr[$(expr "$1" + 6)]}" -eq "$2" ]
		then
			echo "1"
		fi
	elif [ "$1" -eq 7 -o "$1" -eq 8 -o "$1" -eq 9 ]
	then
		if [ "${arr[$(expr "$1" - 3)]}" -eq "$2" -a "${arr[$(expr "$1" - 6)]}" -eq "$2" ]
		then
			echo "1"
		fi
	else
		if [ "${arr[$(expr "$1" + 3)]}" -eq "$2" -a "${arr[$(expr "$1" - 3)]}" -eq "$2" ]
		then
			echo "1"
		fi
	fi
}

function dcheck()
{
	#echo "dcheck"
	if [ "$1" -eq 1 -o "$1" -eq 5 -o "$1" -eq 9 ]
	then
		if [ "${arr[1]}" -eq "$2" -a "${arr[5]}" -eq "$2" -a "${arr[9]}" -eq "$2" ]
		then
			echo "1"
		fi
	elif [ "$1" -eq 3 -o "$1" -eq 5 -o "$1" -eq 7 ]
	then
		if [ "${arr[3]}" -eq "$2" -a "${arr[5]}" -eq "$2" -a "${arr[7]}" -eq "$2" ]
		then
			echo "1"
		fi
	fi
}

clear
i=1
while [ "$i" -le 9 ]
do
	arr["$i"]=0
	i=`expr $i + 1`
done
player=0
i=1
clr=0
while [ "$i" -le 9 ]
do
	if [ $clr -eq 0 ]
	then
		clr=0
		clear
		print 1
	fi
	if [ `expr $player % 2` -eq 0 ]
	then
		clr=0
		echo -e "\t\tPlayer 1 Turn (X):-"
		echo -n -e "\t\tPosition : "
		read p
		if [ "${arr[p]}" -eq 0 ]
		then
			arr[$p]=1
			v1=$(vcheck "$p" 1)
			h1=$(hcheck "$p" 1)
			d1=$(dcheck "$p" 1)
			#echo "v1:$v1,h1:$h1,d1:$d1"
			if [ $v1 -eq 1 ]
			then
				clear
				print 1				
				echo -e "\t\tPlayer 1 has won the Game!!!!"
				exit
			fi
			if [ "$d1" -eq 1 ]
			then
				clear
				print 1
				echo -e "\t\tPlayer 1 has won the Game!!!!"
				exit
			fi
			if [ "$h1" -eq 1 ]
			then
				clear
				print 1
				echo -e "\t\tPlayer 1 has won the Game!!!!"
				exit
			fi
		else
			echo -e "\t\tAlready entered"
			clr=1			
			continue
		fi
	else
		clr=0
		echo -e "\t\tPlayer 2 Turn (O):-"
		echo -n -e "\t\tPosition : "
		read p
		if [ "${arr[p]}" -eq 0 ]
		then
			arr[$p]=2
			v2=$(vcheck "$p" 2)
			h2=$(hcheck "$p" 2)
			d2=$(dcheck "$p" 2)
			#echo "v2:$v2,h2:$h2,d2:$d2"
			if [ $v2 -eq 1 ]
			then
				clear
				print 1				
				echo -e "\t\tPlayer 2 has won the Game!!!!"
				exit
			fi
			if [ "$d2" -eq 1 ]
			then
				clear
				print 1
				echo -e "\t\tPlayer 2 has won the Game!!!!"
				exit
			fi
			if [ "$h2" -eq 1 ]
			then
				clear
				print 1
				echo -e "\t\tPlayer 2 has won the Game!!!!"
				exit
			fi
		else
			echo -e "\t\tAlready entered"
			clr=1
			continue
		fi
	fi
	player=`expr $player + 1`
	print 1
	i=`expr $i + 1`
done
clear
print 1
echo -e "\t\t\tGame Tied"

