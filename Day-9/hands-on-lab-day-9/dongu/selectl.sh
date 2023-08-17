
read -p "İlk numarayi gir: " first_number
read -p "İkinci numarayi gir: " second_number

PS3="Operasyonu sec: "

select operation in addition subtraction multiplication division exit
do
  case $operation in
    
    multiplication)
       echo "result= $(( $first_number * $second_number))" 
       ;;
    division)
       echo "result= $(( $first_number / $second_number))"
    ;;
    addition) 
      echo "result= $(( $first_number + $second_number))"
    ;;
    subtraction)
       echo "result= $(( $first_number - $second_number))"
    ;;
    exit)
       break
    ;;   
    *)
       echo "Wrong choice..." 
    ;;
  esac
done
