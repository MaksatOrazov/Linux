read -p "Bana bir numara ver: " number
if [[ $number -gt 10 ]]
then
  echo "Numara 10 dan buyuk"

  if (( $number % 2 == 1 ))
  then
    echo "ve ayrica kendisi bir tekil"
  else
    echo "ve ayrica kendisi bir cift"
  fi
else
  echo "numara 10 a esit veya 10 dan kucuk"
fi
