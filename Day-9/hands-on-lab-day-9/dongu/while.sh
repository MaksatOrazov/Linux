number=10

while [[ $number -le 100 ]]
do
    echo $number
    ((number++))
done
echo "While loop is on the $number th row"
