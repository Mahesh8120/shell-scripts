#!/bin/bang

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
R="\e[31m
G="\e[32m
N="\e[0m

VALIDATE(){                            
  if [ $? -ne 0 ]
  then
      echo -e" $R installation is .....failed $N"
      exit 1
  else
      echo -e "$G installation is .....success $N"
}

if [ $ID -ne 0 ]
then
    echo -e"$R Error:run this script with root user access $N"
    exit 1
else 
    echo -e "$G you are root user $N"

yum install git -y
VALIDATE 

yum install mysql -y
VALIDATE