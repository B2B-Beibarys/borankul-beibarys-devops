#!/bin/bash

NAME="Beibarys"
SURNAME="Borankul"
GROUP="IT2-2306"
STUDENT_ID="38293"
INFO_FILE="$(dirname "$0")/../Borankul_Beibarys_info.txt"

echo "=============================="
echo "Student Information"
echo "=============================="
echo
echo "Name: $NAME"
echo "Surname: $SURNAME"
echo "Group: $GROUP"
echo "Student ID: $STUDENT_ID"
echo
echo "=============================="
echo "System Information"
echo "=============================="
echo
echo "Username: $(whoami)"
echo "Hostname: $(hostname)"
echo "Current Date: $(date)"
echo "Operating System: $(uname -sr)"
echo "Disk Usage: $(df -h / | awk 'NR==2 {print $3 " used of " $2 " (" $5 ")"}')"
echo "Memory Usage: $(free -h | awk '/Mem:/ {print $3 " used of " $2}')"
echo

if [ -f "$INFO_FILE" ]; then
    echo "Student information file exists."
else
    echo "Student information file does not exist."
fi
