#!/bin/bash

ID=$(id -u)

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="tem/$0-$TIMESTAMP.log"
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "Error: $2 is failed"
        exit 1 
    else
        echo "$2 success"  
    fi 
}    
    
     if [ $ID -ne 0 ]
    then
        echo "Error:run this script with root access"
        exit 1
    else
        echo "you are root user"
    fi    

    yum install mysql -y

    VALIDATE $? "installing mysql" &>>$LOGFILE

    yum install git -y
     
    VALIDATE $? "insalling git" &>>$LOGFILE
