# CONDITIONAL LOGIC

Purpose of the this hands-on training is to teach the students how to use conditional statements in shell.

## Learning Outcomes

At the end of the this hands-on training, students will be able to;

- explain conditional statements in shell.

- use if statements in shell scripting

- use case statements in shell scripting

## IF STATEMENT

- Unix Shell supports conditional statements that are used to perform different actions on the basis of different conditions.

- A simple if statement essentially states, if a particular test is true, then perform a specified set of actions. If it's not true, don't take those acts.

- Create a folder and name it `conditionals`.

```bash
mkdir conditionals
cd conditionals
```

- Create a `script` file named `if.sh`. 

```bash
cat > if.sh
# press ctrl + d when you done with if.sh
```

```bash
#!/bin/bash
read -p "Give me a number: " number

if [[ $number -gt 50 ]]
then
  echo "This number is greater than 50."
fi
```

- Make the script executable and execute it.

```bash
chmod +x if.sh
./if.sh
```

> Notice that there are spaces between the opening brackets `[[` and the parameters, and then between the parameters and the closing brackets `]]`. That is precisely because the brackets here act as a command, and we are separating the command from its parameters.


### Relational Operators

- Comparing statement can be used as:

![co](images/co.PNG)

- Bourne Shell supports the relational operators below that are specific to numeric values. These operators do not work for string values.

| Operator | Description |
| -------- | ----------- |
| -eq   | equal                  |
| -ne   | not equal              |
| -gt   | greater than           |
| -lt   | less than              |
| -ge   | greater than or equal  |
| -le   | less than or equal     |

### String Operators

 Conditional Operators that works in **`bash`**

![cb](images/cb.PNG)


- The string operators below are supported by Bourne Shell.

| Operator | Description |
| -------- | ----------- |
| =    | equal            |
| !=   | not equal        |
| -z   | Empty string     |
| -n   | Not empty string |


- Let's see this. Create a file and name it `operation-string.sh`

```bash
cat > operation-string.sh
# press ctrl + d when you done with if.sh
```

```bash
#!/bin/bash

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
```

- Notice that there are spaces between the opening bracket `[[` and the parameters "text" = "text", and then between the parameters and the closing bracket `]]`. That is precisely because the brackets here act as a command, and we are separating the command from its parameters.

- Make the script executable and execute it.

```bash
chmod +x operation-string.sh
./operation-string.sh
```

### File Test Operators

- There are a few operators that can be used to test various properties associated with a Linux file.

| Operator | Description |
| -------- | ----------- |
| -d file   | directory  |
| -e file   | exists     |
| -f file   | ordinary file     |
| -r file   | readable          |
| -s file   | size is > 0 bytes |
| -w file   | writable          |
| -x FILE   | executable        |

![cond1](images/cond1.PNG)

- Let's try this. Create files below and configure them.

```bash
mkdir folder # mkdir command in Linux allows the user to create directories

touch file # The touch command is a standard command used in UNIX/Linux operating system which is used to create, change and modify timestamps of a file

chmod 400 file # Gives the user read permission, and removes all other permission.
```

Create a file and name it `operation-file.sh`

```bash
cat > operation-file.sh
# press crtd + d when you done to save your changes
```

```bash
#!/bin/bash

if [[ -d folder ]]
then
  echo "This folder is a directory"
fi

if [[ -f file ]]
then
  echo "file is an straight file"
fi

if [[ -r file ]]
then
  echo "This is a readable file"
fi

if [[ -w file ]]
then
  echo "This is a writable file"
fi

if [[ -s file ]]
then
  echo "This is more than 0 bytes"
fi

if [[ -x $0 ]]
then
  echo "$0 is an executable file "
fi
```

- Make the script executable and execute it.

```bash
chmod +x operation-file.sh
./operation-file.sh
```

## If Else Statements

- Sometimes we want to execute a block of code if a statement is true, and another block of code if it is false.

- Create a `script` file named `ifelse.sh`.

```bash
cat > ifelse.sh
# press crtd + d when you done to save your changes
```

```bash
#!/bin/bash
read -p "Give me a number: " number

if [[ $number -ge 10 ]]
then
  echo "The number is > or = to 10."
else 
  echo "The number is < 10"
fi
```

- Make the script executable and execute it.

```bash
chmod +x ifelse.sh
./ifelse.sh
```

## Elif Statements

- The elif statement is used when it requires to specify several conditions in our program.

- Create a `script` file named `elif.sh`.

```bash
cat > elif.sh
# press crtd + d when you done to save your changes
```

```bash
#!/bin/bash
read -p "Give me a number: " number

if [[ $number -eq 10 ]]
then
  echo "The number is = 10."
elif [[ $number -gt 10 ]]
then
  echo "The number is > 10"
else 
  echo "The number is < 10"
fi
```

- Make the script executable and execute it.

```bash
chmod +x elif.sh
./elif.sh
```

## Nested If Statements

- If statements can be nested. Let's see the nested structure on the followig example.

- Create a `script` file named `nestedif.sh`.

```bash
cat > nestedif.sh
# press crtd + d when you done to save your changes
```

```bash
#!/bin/bash

read -p "Give me a number: " number

if [[ $number -gt 10 ]]
then
  echo "Number is > 10"

  if (( $number % 2 == 1 ))
  then
    echo "And it is also an odd number."
  else
    echo "And it is also an even number"
  fi
else 
  echo "Number is less than or equal to 10"
fi
```

- Make the script executable and execute it.

```bash
chmod +x nestedif.sh
./nestedif.sh
```


## Boolean Operations

- The Boolean operators below are supported by the Bourne Shell.

| Operator | Description |
| -------- | ----------- |
| !        | negation    |
| &&       | and         |
| \|\|     | or          |


- `!`  inverts a true condition into false and vice versa.

- `&&` is logical AND. If both the operands are true, then the condition becomes true otherwise false.

- `||`	is logical OR. If one of the operands is true, then the condition becomes true.


- Create a `script` file named `boolean-operators.sh`.

```bash
cat > boolean-operators.sh
# press crtd + d when you done to save your changes
```

```bash
#!/bin/bash

read -p "Type here a name: " name
read -sp "Type here a password: " password

if [[ $name = $(whoami) ]] && [[ $password = Aa1234 ]]
then
  echo -e "\nWelcome $(whoami)"
else
  echo -e "\nIt is wrong account"
fi
```

- Make the script executable and execute it.

```bash
chmod +x boolean-operators.sh
./boolean-operators.sh
```

## Case Statements

- To execute a multiway branch, we can use several if-elif statements but that would soon become complicated. Bash case statements are similar to if-else statements but are easier and simpler. It helps to match one variable against several values.

- Create a `script` file named `case-statement.sh`. 

```bash
cat > case-statement.sh
# press crtd + d when you done to save your changes
```

```bash
#!/bin/bash

read -p "Input first number: " first_number
read -p "Input second number: " second_number
read -p "Select an math operation
1 - addition
2 - subtraction
3 - multiplication
4 - division
" operation

case $operation in
  "1") 
     echo "result= $(( $first_number + $second_number ))"
  ;;
  "2")
     echo "result= $(( $first_number - $second_number ))"
  ;;
  "3")
     echo "result= $(( $first_number * $second_number ))" 
     ;;
  "4")
     echo "result= $(( $first_number / $second_number ))"
  ;;
  *)
     echo "Wrong choice..." 
  ;;
esac
```

- Make the script executable and execute it.

```bash
chmod +x case-statement.sh
./case-statement.sh
```

## MORE EXERCISES

```bash
1) Code a statement that gets the filename, and checks if the file exists or not and it throws the appropriate information.

2) Code a statement that reads two integer numbers from user, and checks if both the numbers are equal or greater or lesser than each other.

3) Code a statement that reads input(11 and 12), which is a type of arithmetic operation wants to perform on bash variables (inp1 and inp2). The arithmetic operation could be addition, subtraction or multiplication..

4) Create variable a and variable b. Set them 10 and 20 subsequently. Create an if statement that returns "a is equal to b" if a == b and "a is not equal to b" if a != b.

5) Create variable a and variable b. Set both of them 20. Create an if statement that returns "a is equal to b"  if a == b and returns otherwise if "a is not equal to b".

6) Create variable CARS and set it to "bmw". Then return "Headquarters - Affalterbach, Germany" if its value is mercedes(case 1), "Headquarters - Ingolstadt, Germany"if its value is audi(case 2),  "Headquarters - Chennai, Tamil Nadu, India" if its value is bmw(case 3). Complete and type the whole process by using case statement.
```

**Answers**

1) Solution is given below...

<details>

```bash
$ cat  > exist.sh


file=$1
if [ -e $file ]
then
	echo -e "File $file exists"
else
	echo -e "File $file doesnt exists"
fi

# press ctrl + d and run the following commands
$ ./exist.sh
```

</details>

2) Solution is given below...

<details>

```bash
$ cat > numbers.sh


echo "Please enter first number"
read first
echo "Please enter second number"
read second

if [ $first -eq 0 ] && [ $second -eq 0 ]
then
	echo "Num1 and Num2 are zero"
elif [ $first -eq $second ]
then
	echo "Both Values are equal"
elif [ $first -gt $second ]
then
	echo "$first is greater than $second"
else
	echo "$first is lesser than $second"
fi

# press ctrl + d and type the following
$ ./numbers.sh

```

</details>


3) Solution is given below...

<details>

```bash
$ cat   > calculator.sh
#!/bin/bash

inp1=11
inp2=12
echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiplication"
echo -n "Please choose a word [1,2 or 3]? "
read oper

if [ $oper -eq 1 ]
then
	echo "Addition Result " $(($inp1 + $inp2))
else
	if [ $oper -eq 2 ]
	then
		echo "Subtraction Result " $(($inp1 - $inp2))
	else
		if [ $oper -eq 3 ]
		then
			echo "Multiplication Result " $(($inp1 * $inp2))
		else
			echo "Invalid input"
		fi
	fi
fi

$ ./calculator.sh
1. Addition
2. Subtraction
3. Multiplication
Please choose a word [1,2 or 3]? 4
Invalid input
```

</details>

4) Solution is given below...

<details>


```bash
#Initializing two variables
a=10
b=20

#Check whether they are equal
if [ $a == $b ]
then
	echo "a is equal to b"
fi

#Check whether they are not equal
if [ $a != $b ]
then
	echo "a is not equal to b"
fi

```

</details>

5) Solution is given below...

<details>

```bash
#Initializing two variables
a=20
b=20

if [ $a == $b ]
then
	#If they are equal then print this
	echo "a is equal to b"
else
	#else print this
	echo "a is not equal to b"
fi
```

</details>

6) Solution is given below...

<details>

```bash
CARS="bmw"

#Pass the variable in string
case "$CARS" in
	#case 1
	"mercedes") echo "Headquarters - Affalterbach, Germany" ;;
	
	#case 2
	"audi") echo "Headquarters - Ingolstadt, Germany" ;;
	
	#case 3
	"bmw") echo "Headquarters - Chennai, Tamil Nadu, India" ;;
esac

```

</details>