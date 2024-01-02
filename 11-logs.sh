#!/bin/bash

ID=$(id -u)

R="/e[31m"
G="/e[32m"
N="/e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="tem/$0-$TIMESTAMP.log"
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "Error: $2 is $R failed $N"
        exit 1 
    else
        echo "$2 $G success $N"  
    fi 
}    
    
     if [ $ID -ne 0 ]
    then
        echo " $R Error:run this script with root access $N"
        exit 1
    else
        echo "you are root user"
    fi    

    yum install mysql -y &>> $LOGFILE

    VALIDATE $? "installing mysql" 

    yum install git -y &>> $LOGFILE
     
    VALIDATE $? "insalling git" 
