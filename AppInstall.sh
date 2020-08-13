#! /bin/bash

snap list | grep libreoffice > /dev/null
if [ $? == 0 ]
then 
    s1="+"
else
    s1="-"
fi

snap list | grep zoom-client > /dev/null
if [ $? == 0 ]
then 
    s2="+"
else
    s2="-"
fi

snap list | grep chromium > /dev/null
if [ $? == 0 ]
then 
    s3="+"
else
    s3="-"
fi


echo "Escolha uma app:"
echo "[$s1] libreoffice"
echo "[$s2] zoom-client"
echo "[$s3] chromium"
echo "Outra (escreva o nome)"

read -p ">>> " choice

sudo snap install $choice