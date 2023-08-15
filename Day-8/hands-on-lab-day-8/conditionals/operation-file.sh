
if [[ -d folder ]]
then
  echo "This folder is a directory"
fi

if [[ -f file ]]
then
  echo "file is a straight file"
fi

if [[ -r file ]]
then
  echo "This is a readable file"
fi

if [[ -w file ]]
then
  echo "This is a writable file"
fi

if [[ -x $0 ]]
then
  echo "$0 is an executable file "
fi
