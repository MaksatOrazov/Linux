numara=20

while [[ $numara -gt 1 ]]
do
  echo $numara
  ((numara++))
  if [[ $numara -eq 100 ]]
  then
    break
  fi
done
