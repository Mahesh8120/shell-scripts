#!/bin/bang

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){                            
  if [ $1 -ne 0 ]
  then
      echo -e "$2 is .....$R failed $N"
      exit 1
  else
      echo -e "$2 is .....$G success $N"
  fi   
}

if [ $ID -ne 0 ]
then
    echo -e"$R Error:run this script with root user access $N"
    exit 1
else 
    echo -e "$G you are root user $N"
fi    

yum install git -y
VALIDATE $? installing git

yum install mysql -y
VALIDATE $? installing mysql