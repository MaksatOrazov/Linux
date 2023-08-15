read -p "Buraya isim gir: " name
read -sp "Buraya da sifreni gir: az yaratici ol 12345 falan koyma" password

if [[ $name = $(whoami) ]] && [[ $password = Aa1234 ]]
then
  echo -e "\nWelcome $(whoami)"
else
   echo -e "\nIt is wrong account"
fi
