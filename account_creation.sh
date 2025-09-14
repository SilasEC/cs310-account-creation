#Account creation script
# Silas Curtis
# CS 310
#Due 9/15/25
# This script allows a user to create an account with options listed in assignment specification.


#!/bin/bash

read -p "Enter full name (First Last): " fullname

firstname=$(echo $fullname | awk '{print $1}')
lastname=$(echo $fullname | awk '{print $2}')

echo "Choose role: User, AV Tech, Admin"
read -p "Role: " role

username="${firstname}-${lastname}"

if [ "$role" == "User" ]; then
    groups=""
elif [ "$role" == "AV Tech" ]; then
    groups="video,audio"
elif [ "$role" == "Admin" ]; then
    groups="root"
else
    echo "Unknown role, defaulting to User"
    role="User"
    groups=""
fi

echo ""
echo "Full Name: $fullname"
echo "Username: $username"
echo "Role: $role"
if [ -n "$groups" ]; then
    echo "Groups: $groups"
else
    echo "Groups: None"
fi

read -p "Press Enter to create the account..."
if [ -n "$groups" ]; then
    sudo useradd -m -G "$groups" "$username"
else
    sudo useradd -m "$username"
fi

echo "Account created."
