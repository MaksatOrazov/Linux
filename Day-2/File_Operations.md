# Hands-on Linux-01 : Files Operations

- Create and edit files

- Read / Write files

- Search files

## Part 1 - Working with File Contents

- Create a folder and name it "new folder"

```bash
mkdir new folder
cd new folder
```

- Create a `text` file named `techproed.txt`

```txt
Linux File System -1
/ - Root directory that forms the base of the file system. All files and directories are logically contained inside the root directory regardless of their physical locations. 
/boot - Contains the Linux kernel and other files needed by LILO and GRUB boot managers. 
/dev - Contains all device files.
```

- Show the first 10 lines of techproed.txt, use `head` command

```bash
head techproed.txt
```

- Show the first 5 lines of techproed.txt

```bash
head -5 techproed.txt
```

- Show the last 10 lines of techproed.txt, use `tail` command

```bash
tail techproed.txt
```

- Show the last 5 lines of techproed.txt

```bash
tail -5 techproed.txt
```

- Display the techproed.txt file on the screen, use `cat` command

```bash
cat techproed.txt
```

- Create three files with echo command and name them file1 file2 file3

```bash
echo "this is file1" > file1
echo "this is file2" > file2
echo "this is file3" > file3
```

- Display the file1, file2 and file3 files on the screen

```bash
cat file1 file2 file3
```

- Concatenate file1, file2 and file3 to `all.txt` file, use `cat` command

```bash
cat file1 file2 file3 > all.txt
```

- Create a file with `cat` command

```bash
cat > summer.txt 
Today is cold.
Today is rainy
```

- After the last line, type and press `ctrl+D` to save the lines

- View the techproed.txt file with the `more` command

```bash
more techproed.txt
```

- View the techproed.txt file with the `less` command

```bash
less techproed.txt
```

- The main difference between more and `less` is that less command is faster because it does not load the entire file at once and allows navigation though file using page up/down keys. 

