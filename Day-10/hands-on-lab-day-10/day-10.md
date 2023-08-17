# FUNCTIONS

- Functions within a shell script is a piece of code or a block of code that perform a particular function that can be reused.

-  Functions enable you to reuse code. We can call the functions numerous times.

- When a shell script runs it runs line-by-line. So your Function must **`always be defined first`** before calling it, if not then it will give error.

- The return statement within a function call helps in specifying the exit code for that function. It is just like the exit code for the entire script but in this case it 
wont exit the script but the function.

**When to use Functions?**

- Break up large script that performs many different tasks
- Installing packages
- Adding users
- Configuring firewalls
- Perform Mathematical calculations

- Create a folder and name it `fonksiyonlar`.

```bash
mkdir fonksiyonlar
cd fonksiyonlar
```

- It is pretty easy to declare and call a function. Create a `script` file named `fonksiyonlar.sh`. 

```bash
cat > fonksiyonlar.sh
# press ctrl + d to quit
```

```bash
#!/bin/bash

Hosgeldin () {  # This is how we define a function
    echo "Linux derslerine hosgeldin!!"
}

Hosgeldin # This is how we close a function. If we don't type it, there will be no output
```

- Make the script executable and execute it.

```bash
chmod +x fonksiyonlar.sh
./fonksiyonlar.sh
```

## Part 2 - Passing Arguments to Functions

- We can pass any number of arguments to the bash function in a similar way to passing command line arguments to a script. We simply supply them right after the function’s name, separated by a space. These parameters would be represented by $1, $2 and so on, corresponding to the position of the parameter after the function’s name.

- Let's update the `fonksiyonlar.sh` script to see this.

```bash
#!/bin/bash

Hosgeldin () {
    echo "Linux derslerine hosgeldin $1 $2 $3"
}

Hosgeldin

```

- And execute it.

```bash
./fonksiyonlar.sh
# See, same output!!
```

## Part 3 - Returning Values from Functions

- Functions in other programming languages return a value when called. But, Bash functions don’t return a value when called. But we can define a return status similar to exit status of a command.

- We already mention about it in Chapter 3, but no harm is done to repeat.

- When any shell command terminates, it returns an exit code, which indicates `0` for success and non-zero decimal number in the `1 - 255` range for failure. The special variable `$?` returns the exit status of the last executed command. Let's see this.

```bash
pwd
echo $?  #0
pwt  # It is wrong command
echo $?  #127
```

- When a return statement is used in a function body, the execution of the function is stopped.

- When a bash function completes, its return value is the status of the last statement executed in the function. We can specify return status by using the `return` keyword. We can think the `return` keyword as exit status of function.

- Add `return 10` line to `Hosgeldin` function.

```bash
#!/bin/bash

Hosgeldin () {
   echo "Hosgeldin $1 $2"
   return 10
   # After the return value, inside the function, no input is accepted
}

# Invoke your function
Hosgeldin Tevfik Sastim

# Capture value returned by last command
ret=$?

# Print the return value
echo "Return value is $ret"
```

- And execute it.

```bash
./fonksiyonlar.sh
```

## Part 4 - Nested Functions

- One of the useful features of functions is that they can call themselves and other functions. 

- Create a `script` file named `icice-fonksiyonlar.sh`.

```bash
cat > icice-fonksiyonlar
# press ctrl + d when you're done
```

```bash
#!/bin/bash

fonksiyon_bir () {
   echo "Bu birinci fonksiyonun ciktisi"
   ikinci_fonksiyon # here, we can see the nested structure
}

ikinci_fonksiyon () {
   echo "Ve bu da ikinci fonksiyonun ciktisi"
}

fonksiyon_bir
```

- Make the script executable and execute it.

```bash
chmod +x icice-fonksiyonlar.sh
./icice-fonksiyonlar.sh
```

## Part 5 - Variables Scope

- Global variables are variables that can be accessed from anywhere in the script regardless of the scope. In Bash, by default all variables are defined as global, even if declared inside the function.

- Local variables can be declared within the function body with the local keyword and can be used only inside that function.

- Create a `script` file named `varscope.sh`.

```bash
cat > varscope.sh
# press ctrl+d when you're done
```

```bash
#!/bin/bash

var1='global 1'
var2='global 2'

var_scope () { # name of our function is var_scope
  local var1='birinci_fonksiyon' # This variable will be local, not global
  var2='ikinci_fonksiyon'
  echo -e "Fonksiyonun icindeki:\nvar1: $var1\nvar2: $var2"
}

echo -e "Fonksiyonu cagirmadan once:\nvar1: $var1\nvar2: $var2"

var_scope

echo -e "Fonksiyonu cagirdiktan sonra:\nvar1: $var1\nvar2: $var2"
```

- Make the script executable and execute it.

```bash
chmod +x varscope.sh
./varscope.sh
```

### Further Documentation

- Google's **`styleguide`** can be used for further documentation.

[styleguide](https://google.github.io/styleguide/shellguide.html)


-------------------------------

### EXERCISES

```bash

1) Move the similar lines of codes into a new function named read_numbers. Then replace all lines with a call to this function.

Move Lines 14, 15, 19, 20, 25, 26, 30, 31

Script uses function read_numbers
Script can add
Script can substract
Script can multiply
Script can divide

2) Create a function that adds 3 users. 1 will be used for username, other one will be used for strong  password, another one will be used for weak password 
    Name of the function:add_a_user()
    First user: arif Arif Isik
    Second user: ceku Ceku Gora
    Third user: 216 ikiyuzonalti
```

**Solutions**

1) Solution is above. 

<details>
#!/bin/bash
function read_numbers(){
  read -p "Enter Number1: " number1
  read -p "Enter Number2: " number2
}

while true
do
  echo "1. Add"
  echo "2. Subsctract"
  echo "3. Multiply"
  echo "4. Divide"
  echo "5. Quit"

  read -p "Enter your choice: " choice

  case $choice in
    1)  read_numbers
        echo $(( $number1 + $number2 )) ;;
    2)
        read_numbers
        echo $(( $number1 - $number2 )) ;;

    3)
        read_numbers
        echo $(( $number1 * $number2 )) ;;

    4)
        read_numbers
        echo $(( $number1 / $number2 )) ;;

    5)  break
  esac

done
</details>

2) Solution is given below...

<details>

```bash

add_a_user()
{
  USER=$1
  PASSWORD=$2
  shift; shift;
  # Having shifted twice, the rest is now comments ...
  COMMENTS=$@
  echo "Adding user $USER ..."
  echo useradd -c "$COMMENTS" $USER
  echo passwd $USER $PASSWORD
  echo "Added user $USER ($COMMENTS) with pass $PASSWORD"
}

###
# Main body of script starts here
###
echo "Start of script..."
add_a_user arif letmein Arif Isik              
add_a_user ceku strongpassword Ceku Gora        
add_a_user 216 weakpassword ikiyuzonalti                
echo "End of script..."
```

</details>
