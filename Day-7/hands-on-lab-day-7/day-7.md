# Hands-on Linux: SHELL SCRIPTING

Purpose of the this hands-on training is to teach the students how to script in shell.

## Learning Outcomes

At the end of the this hands-on training, students will be able to;

- explain shell scripting basics.

- explain shell variables.

- do simple arithmetic.


## Outline

- Part 1 - Shell Scripting Basics

- Part 2 - Shell Variables

- Part 3 - Simple Arithmetic


## Part 1 - Shell Scripting Basics

- Create a folder and name it shellscr.

```bash
mkdir shellscr
cd shellscr
```

- Create a `script` file named `basic.sh`. Note all the scripts would have the .sh extension.

```bash
cat > basic.sh
```

```bash
#!/bin/bash
echo "Hello World"
```

- Before we add anything else to our script, we need to alert the system that a shell script is being started.
This is done specifying `#!/bin/bash` on the first line, meaning that the script should always be run with bash, rather than another shell. `#!` is called a `shebang` because the `#` symbol is called a hash, and the `!` symbol is called a bang.

- After to save the above content, we need to make the script executable.

```bash
chmod +x basic.sh
```

- Then we can execute the `basic.sh`. To execute basic.sh, it is required to add **./** beginning of the `basic.sh`. **"./"** means we're calling something in the current working directory. We have to specify the path for executables if they're outside our $PATH variable.

```bash
./basic.sh
```

- We can add the other shell commands to our script.

```bash
#!/bin/bash
echo "hello"
date
pwd
ls
```

- And execute again.

```bash
./basic.sh
```

### Shell Comments

- Bash ignores everything written on the line after the hash mark `(#)`. The only exception to this rule is the first line of the script that starts with the `#!` characters. 

- Comments can be added at the beginning on the line or inline with other code. Let's update `basic.sh`.

```bash
#!/bin/bash
echo "hello"
# date
pwd # This is an inline comment
# ls
```

### HEREDOC syntax

- A heredoc consists of the **<<** `(redirection operator)`, followed by a delimiter token. After the delimiter token, lines of string can be defined to form the content. Finally, the delimiter token is placed at the end to server as the termination. The delimiter token can be any value as long as it is unique enough that it won’t appear within the content.

- Let's see how to use HereDoc.

```bash
cat << EOF
Welcome to the Linux Lessons.
This lesson is about the shell scripting
EOF
```

- Update the `basic.sh`.

```bash
#!/bin/bash
echo "hello"
# date
pwd # This is an inline comment
# ls

cat << EOF
Welcome to the Linux Lessons.
This lesson is about the shell scripting
EOF

<< multiline-comment
pwd
ls
Everything inside the
HereDoc body is
a multiline comment
multiline-comment
```

- Execute the basic.sh.

```bash
./basic.sh
```
-------------------------------

## VARIABLES


## A Variable in Shell script

- A variable is a value that can vary or change.

- A variable always has a **`$`** sign before it's name.

- A variable name may only contain alphanumeric or underscores

- A variable is case sensitive.

- To set the value for a variable

```bash
$ my_variable=degisken

# To print the value of the variable
echo $my_variable
```

* Create a varible and name it,benim_variable and set the following value:degisken2

* Solution

<details>
$ benim_variable=degisken2

</details>



- We can also use variables to store the result of another command and print it.

```bash
$ varible3=$(ls)
$ echo " to list files or directories use the following variable: $varible3"
```

* Create a varible named variable4 that creates or makes new directories. (Use `pwd` inside your variable) Then print your variable's value with the following: "working directory:  "

* Solution

<details>
```bash
$ varible3=$(pwd)
$ echo "working directory : $varible3"
```

</details>


## Best Practices

* Variable names must be in lower-case with underscores to seperate words.

* Example:

```bash
# Good
birinci_variable

# bad
Birinci_Variable
Birinci Variable
Birinci-variable
```

-------------------------------

### COMMAND LINE ARGUMENTS

In the section, we will take a look at "Command Line Arguments" in shell scripts.

We can replace the hardcoded names within our script with the built in variable.

The command run by user is splitted to the built-in variables. 

- $0, $1, $2, $3 ... etc. are built in variables. These are called as **command line arguments**.


* Create the variable5 with the following value: `"merhaba bugun neler yapiyorsun"` and call the each specific value by using command line arguments

* Solution

<details>
```bash
$ varible5="merhaba bugun neler yapiyorsun"
$ variable5 $0 = merhaba bugun neler yapiyorsun /usr/bin/bash (value with var directory)
$ variable5 $1 = merhaba bugun neler yapiyorsun # value only
```

</details>

## Best Practices

- It is a best practice to assign a varaible to a meaningful variable name

* Design your script to be re-usable

* Script should not require to be edited before running

* Use command line arguments to pass inputs. 

-------------------------------

### READ INPUTS

In this section, lets take a look at prompting for inputs in a shell script

To prompt the user for input, use the **`read`** statement followed by adding a **`prompt`** with **`-p`** option.


* Read takes an input from the user.

* If we only use `read` , nothing is displayed on the console before we enter the input. To avoid this, we use `read`with `-p` statement.

```bash
#  read  takes input, p = print degisken7 is our variable
$ degisken7=yedincidegisken
$ read -p "Degisken 7:"
# Set a value
$ echo $degisken7

# See, the value has updated..
```

* Create the variable7 with the following value: seventhvariable and read it with the following `Variable 7:` by using `read -p` Then, set its value to 7

* Solution

<details>

```bash
$ variable7=seventhvariable
$ read -p "Variable 7:"
7
echo $variable7
```

</details>

#### When to use **`Command Line Arguments`** and **`Read Inputs`** ?

* When you want manual intervention on your program, use  `read`.

* When you do not want manual intervention on your program, don not use  `read`. It might be the case for most of the time since your program will communicate with other programs without manuel intervention.

* You can also use `read` and `CLA` at the same time. 

-------------------------------

### Arithmetic Operations 


In this section, we will take a look at "Arithmetic Operations"

- There are different methods with which we can perform arithemetic operations

#### **expr**

- For addition

```bash
$ expr 6 + 3
```

- For substraction

```
$ expr 6 - 3
```

- For Division

```
$ expr 6 / 3
```

- For Multiplication

```bash
$ expr 6 \* 3 # do not use * alone for multipilication since it is used as RegEx
```

* Add, substract, divide and multiple 15 and 17 by using `expr`

* Solution

<details>

- For addition

```bash
$ expr 15 + 17
```

- For substraction

```
$ expr 15 - 17
```

- For Division

```
$ expr 15 / 17
```

</details>


- These can be used with vairable substitution as well

```
$ A=6
$ B=3
$ expr $A + $B
$ expr $A - $B
$ expr $A / $B
$ expr $A \* $B
```
![expr](images/expr.PNG)

* Create variable A and set it to 3 & Create variable B and set it to 1

* Add, substract, divide  variable A and variable B by using `expr`

* Solution

<details>

```bash
$ A=3
$ B=1
```

- For addition

```bash
$ expr A + B
```

- For substraction

```
$ expr A - B
```

- For Division

```
$ expr A / B
```

</details>

## Double Parentheses

- Another method for performing arithmetic operations is double parenthesis.

```
$ echo $(( A + B ))
$ echo $(( A-B ))
$ echo $((A / B))
$ echo $((A*B))
```

* Create variable A and set it to 10 & Create variable B and set it to 2

* Add, substract, divide, multiple  variable A and variable B by using `Double Parentheses`

* Solution

<details>

```bash
$ A=10
$ B=2
```

- For addition

```bash
$ echo $(( A + B ))
```

- For substraction

```
$ echo $(( A-B ))
```

- For Division

```
$ echo $((A / B))
```

- For Multiplation

```
$ echo $((A*B))
```

</details>

- You may also programming language C stype manipulations of variables 

```
$ echo $(( ++A ))
$ echo $(( --A ))
$ echo $(( A++ ))
$ echo $(( A-- ))
```

![dp](images/dp.PNG)

* Create variable A and set it to 10
* Manipulate your variable by C stype manipulations.(add 1 & subtract 1)

* Solution

<details>

```bash
$ echo $(( ++A ))
$ echo $(( --A ))
$ echo $(( A++ ))
$ echo $(( A-- ))
```

</details>

#### bc

- expr and "double parentheses" only return decimal output, they do not support floating values.

- For this we use another utility called **`bc`**, it referred to as **`Basic Calculator`**.

- It works in an interactive mode and also you can input to another command as well

```
$ A=10
$ B=3
$ expr $A / $B
$ echo $((A/B))
$ echo $A / $B |bc -l
```
![bc](images/bc.PNG)

* Create the variable A and set it to 35 & variable B and set it to 10

* Divide  variable A and variable B by using `expr` and `bc -l`

* Solution

<details>

```bash

$ A=35
$ B=10
$ echo $A / $B |bc -l
```
</details>
-------------------------------

### MORE EXERCISES
```bash
1) Perform the following actions with `expr`

A = 5
B = 6
A + B
A - B
A * B
A / B

2) Perform the following actions with Double Parentheses Method + bc

A = 5
B = 6
A + B
A - B
A * B
A / B

3) Perform the following actions with Double Parentheses Method + bc
A = 5
B = 6
A + B
A - B
A * B
A / B

4) Create the `ceku`variable and set it to "ceku"

5) Change the  `Ceku` s variable from `ceku` to `Arif` 
```

**Answers**


1) Solution is given below.

<details>

```bash
$ A=5 
$ B=6
$ expr $A + $B 
$ expr $A - $B 
$ expr $A / $B
$ expr $A \* $B 
```
</details>

2) Solution is given below.

<details>

```bash
$ A=5 
$ B=6
$ echo $(( A + B ))
$ echo $(( A-B ))
$ echo $((A / B))
$ echo $((A*B))
```
</details>

3) Solution is given below.

<details>

```bash
$ A=5
$ B=6

$ expr $A + $B
$ echo $((A+B))
$ echo $A + $B |bc -l

$ expr $A - $B
$ echo $((A-B))
$ echo $A - $B |bc -l

$ expr $A / $B
$ echo $((A/B))
$ echo $A / $B |bc -l

$ expr $A \* $B
$ echo $((A\*B))
$ echo $A \* $B |bc -l
```

</details>


4) Solution is given below.

<details>
```bash
$ ceku="ceku"
```
</details>

5) Solution is given below.

<details>
```bash  
$ read -p "Hazirsan Cikalim Balim" ceku
Hazirsan Cikalim BalimArif
```
</details>
-------------------------------