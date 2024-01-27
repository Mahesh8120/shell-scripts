#!/bin/bang

ID=$(id -u)
VALIDATE(){
    if [ $? -ne 0 ]
    then
        echo "installing mysql is failed"
        exit 1 
    else
        echo "installing mysql is success"
    fi        
}
if [ $ID -ne 0 ]
then 
    echo error : "run this script with root user access"
    exit 1
else
    echo  "you are root user"
if

yum install mysql -y
$VALIDATE 