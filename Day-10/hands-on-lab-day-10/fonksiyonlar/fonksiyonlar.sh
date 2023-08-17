Hosgeldin () {
   echo "Hosgeldin $1 $2"
   return 10
   # After the return value, inside the function, no input is accepted
}

# Invoke your function
Hosgeldin Tevfik Sastim

# Capture value returned by last command
ret=$?

# Print the return value
echo "Return value is $ret"
