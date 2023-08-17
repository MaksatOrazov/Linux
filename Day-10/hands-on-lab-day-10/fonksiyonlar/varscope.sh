var1="global 1"
var2="global 2"

var_scope () {
  local var1="birinci_fonksiyon"
  var2="ikinci_fonksiyon"
  echo -e "Fonksiyonun icindeki:\var1: $var1\nvar2: $var2"
}

echo -e "Fonksiyonu cagirmadan once:\nvar1: $var1\nvar2: $var2"

var_scope

echo -e "Fonksiyonu cagirdiktan sonra:\nvar1: $var1\nvar2: $var2"
