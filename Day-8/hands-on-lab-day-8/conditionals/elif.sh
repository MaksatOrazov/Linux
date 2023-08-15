read -p "Bana bir numara ver: " number
if [[ $number -eq 10 ]]
then
  echo "Numara 10 a esit"
elif [[ $number -gt 10 ]]
then
  echo "Numara 10 dan buyuk"
else
  echo "Numara 10 dan kucuk"
fi
