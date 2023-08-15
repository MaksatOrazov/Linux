if [[ "a" = "a" ]]
then
  echo "They are same"
fi

if [[ "a" != "b" ]]
then
  echo "They are not same"
fi

if [[ -z "" ]]
then
  echo "It is an empty file"
fi

if [[ -n "text" ]]
then
  echo "It is not an empty file"
fi
