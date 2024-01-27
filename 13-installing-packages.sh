#!/bin/bang

ID=$(id -u)

if ( $ID -ne 0 )
then 
    echo error : "run this script with root user access"

else
    echo  "you are root user"
if

yum install mysql -y

