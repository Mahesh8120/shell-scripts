#!/bin/bang

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

LOGFILE="/tmp/$0-$TIMESTAMP.log"
 echo "script started executing at $TIMESTAMP" &>> $LOGFILE
VALIDATE(){                            
  if [ $1 -ne 0 ]
  then
      echo -e "$2 .....$R failed $N"
      exit 1 
  else
      echo -e "$2 .....$G success $N"
  fi   
}

if [ $ID -ne 0 ]
then
    echo -e"$R Error:run this script with root user access $N"
    exit 1
else 
    echo -e "$G you are root user $N"
fi    

for package in $@
do
    yum list installed $package
    if [ id -ne 0 ]
    then 
        echo -e "yum install $package -y"
              VALIDATE $? "installing $package"
    else
        echo -e "$package is already installed..... $Y skipping $N"
    fi       
done