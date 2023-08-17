# LOOPS

- Loops is used for repetative tasks.

- Create a folder and name it `donguler`.

```bash
mkdir dongu
cd dongu
```

## Type of Loops

### For Loop

- **`for`** loops is used when you want to run same command multiple times
- Execute a command or a set of commands many times
- Iterate through files
- Iterate through lines within a file
- Iterate through the output of a command

- **`for`** loops can be written in multiple ways:

```
for i in 0 1 2 3 4 5 6 7 8 9
do
     echo $i
done
```

```
for file in $(ls)
do
    echo $file
done
```    

```
for j in {0..100}
do
    echo $j
done
```


- Create a `script` file named `forl.sh`.

```bash
forl.sh
# press ctrl + d to exit
```

- Iterate thorugh list of files from the output of the **`ls`** command

```
for file in $(ls)
do
    echo Line count of $file is $(cat $file | wc -l)
done
```

- Make the script executable and execute it.

```bash
chmod +x forl.sh
./forl.sh
```

-------------------------------

### While Loop


- While loop works just like the for loop, except theat it executes the loop as long as the condition is true.
- Execute a command or a set of commands multiple times but you are not sure how many times.
- Execute a command or a set of commands until a specific condition occurs


- Let's display numbers from 10 to 100 with `while loop`

- Create a script file named `whilel.sh`

```bash
cat > whilel.sh
# press ctrl + d to exit
```

```bash

number=10

while [[ $number -le 100  ]]
do
  echo $number
  ((number++))
done
echo "While loop is on the $number th number now"
# press ctrl + d
```

```bash
./whilel.sh
```

-------------------------------

### Continue and Break Statements

* A loop will continue forever unless the necessary condition is not met. A loop that runs endlessly without terminating can run for an infinite number of times. For this reason, these loops are named infinite loops.

#### Break Statement

* The break statement is used to terminate the execution of the entire loop.

* Create a script file named `brcnt.sh`.

```bash
cat > brcnt.sh
# press ctrl + d to exit
```

```bash
#!/bin/bash

numara=20

while [[ $numara -gt 1  ]]
do
  echo $numara
  ((numara++))
  if [[ $numara -eq 100 ]]
  then
    break
  fi
done
```

* Execute the script.

```bash
./brcnt.sh
```

#### Continue Statement

* The Continue statement is similar to the Break command, except it causes the current iteration of the loop to exit, instead of the whole loop.

* Let's create the `cont.sh`. This time we do not display 5 and its multiples (5,  ..)

```bash
i=0

while [[ $i -lt 5 ]]; do
  ((i++))
  if [[ "$i" == '2' ]]; then
    continue
  fi
  echo "Number: $i"
done

echo 'All Done!'
```

- Execute the script.

```bash
./cont.sh
```

### Select Loops

* The Select Loop generates a numbered menu from which users can select options. It's helpful when you need to ask the user to select one or more items from a list of options.

* Create a script file named `selectl.sh`

``` bash
cat > selectl.sh
# press ctrl+d for exit
```


```bash
#!/bin/bash

read -p "Input first number: " first_number
read -p "Input second number: " second_number

PS3="Select the operation: "

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
```

- Make the script executable and execute it.

```bash
chmod +x selectl.sh
./selectl.sh
```


-------------------------------




### Bourne Shell or Debian Almquist Shell(dash)

- Bourne Shell, if you try to run the same script in **`dash shell`**, it doesnt know how to expand this expression into a seuqnce of numbers

- Bourne Shell is, in fact, the bash shell itself, it is linked to the bash.

- Bash continues to be used as the default interactive/login shell for users, but Dash is the one at `/bin/sh` and the one which is executed for system scripts such as init scripts.

- Dash is very fast, but also is very closely POSIX-compatible - a standard that is aligned closely with the Bourne shell. So in a way, by switching from Bash to Dash we are moving back to a shell more closely aligned with Bourne.
  
![dash](images/dash.PNG)

### Working with bash in Other Shells

- If you want to run the script from another shell, thats not a bash shell, then you must just run it through the bash shell by prefixing the **`bash`** command

![bashc](images/bashc.PNG)

- Our shell is bash shell. Thus, we don't need to type `bash`. In fact, we can do it reverse and type `dash` and try to run `selectl.sh` in dash shell..

### EXIT CODES

- Let's now talk about the Exit-Codes and different types of Exit Codes.

  ![e0](images/e0.PNG)


  ![e1](images/e1.PNG)


- If a command runs successfuly, shell returns `0`.
- If it fails, shell returns a value greater than 0. 
- Command to check the exit code of the the last executed command is  **`echo $?`**

- Check the status of command **`ls`**  by using exit commands.

``` bash
# If it is successfull, echo ? will return 0
$ ls
Success

$ echo $?
0

# If it is failed, echo ? will return 1
$ ls
Failed

$ echo $?
1

```

- Statement `exit` that  we used above(under the `$ls`) is a custom exit code status. In this case, if the command is failed, it'll return 1 as exit code.

-------------------------------

### EXERCISES

```bash 
1) Create a for loop that displays welcome message 5 times

# Desired Output
welcome 1 times
Welcome 2 times
Welcome 3 times
Welcome 4 times
Welcome 5 times

2) Create a simple for loop that prints the numbers 31 to 40 with each number in a new line.

3) Create a while loop that prints the numbers 1 through to 10:

4) Create a for loop for copying files but if the free disk space gets below a certain level that stops copying.(Hint: use `break` within the for loop)

5) Create a for loop to process a series of files but if it  has no read permission for, try not to process it.(Hint: use `continue` within the for loop)

```
-------------------------------

**Answers**

1. Solution is given below

<details>

```bash
#!/bin/bash
for i in 1 2 3 4 5
do
   echo "Welcome $i times"
done
```

</details>

2. Solution is given below

<details>

```bash
for i in {31..40}
do
        echo $i
done

```
</details>

3. Solution is given below.

<details>

```bash
#!/bin/bash
counter=1
while [ $counter -le 10 ]
do
echo $counter
((counter++))
done
echo All done
```

</details>

4. Solution is given below

<details>

```bash
#!/bin/bash
# Make a backup set of files
for value in $1/*
do
used=$( df $1 | tail -1 | awk '{ print $5 }' | sed 's/%//' )
if [ $used -gt 90 ]
then
echo Low disk space 1>&2
break
fi
cp $value $1/backup/
done
```

</details>

5. Solution is given below

<details>

```bash
#!/bin/bash
# Make a backup set of files
for value in $1/*
do
if [ ! -r $value ]
then
echo $value not readable 1>&2
continue
fi
cp $value $1/backup/
done
```

</details>
