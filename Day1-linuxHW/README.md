# Day 1 -Homework

## Part 1 - VirtualBox & Ubuntu Installation

### Answer 1+2+3

![alt text](image.png)

## Part 2 - Linux Directory And File Creation

### Answer 1-

- bash commands:

  ```bash
  cd homework/
  mkdir dir1 dir2 dir3
  ls -l
  ```

  output:
  ![alt text](image-1.png)

- bash commands:

  ```bash
  touch dir1/file1.txt dir1/file2.txt dir1/file3.txt

  #print results
  ls -l ./dir1
  ```

  output:
  ![alt text](image-2.png)

### Answer 2-

bash commands:

```bash
echo "some text" > dir1/file1.txt

#print results
 cat dir1/file1.txt
```

output:
![alt text](image-3.png)

## Part 3 - Using grep and find Commands

### Answer 1-

bash commands:

```bash
ls dir1 | grep txt
```

output:
![alt text](image-5.png)

### Answer 2-

- bash commands:

  ```bash
  find ~/homework -type f
  ```

  output:
  ![alt text](image-4.png)

- bash commands:

  ```bash
    find ~/homework -type f  -mtime -7
  ```

  output:
  ![alt text](image-6.png)
