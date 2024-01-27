#!/bin/bash

ID=$(id -u)
LOGFILE="tem/$0-$TIMESTAMP.log"

R="/e[31m"
G="/e[32m"
N="/e[0m"


VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "Error: $2 is $R failed $N"
        exit 1 
    else
        echo -e "$2 $G success $N"  
    fi 
}    
    
     if [ $ID -ne 0 ]
    then
        echo -e " $R Error:run this script with root access $N"
        exit 1
    else
        echo "you are root user"
    fi    

    yum install mysql -y &>> $LOGFILE

    VALIDATE $? "installing mysql" 

    yum install git -y &>> $LOGFILE
     
    VALIDATE $? "insalling git" 
