read -p "Bana bir numara ver bebegim: " number

if [[ $number -ge 10 ]]
then
  echo "Numara 10 dan buyuk veya 10 a esit."
else
  echo "Numara 10 dan kucuk"
fi
