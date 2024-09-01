# linux_and_shell_scripting_assignment
Assignment to test the proficiency in writing and understanding Bash scripts.


## Question 1 
Write a script that creates the following directory structure:

     /home/vishwesh/

       ├── projects/

       │   ├── project1/

       │   ├── project2/

       │   └── project3/

       ├── documents/

       └── downloads/

#### Solution:
I have used `mkdir -p` for this solution to create the directory structure. The script also checks permission is provided to user to execute the script.

## Question 2
Write a script that takes a directory as an argument and creates a backup of all `.txt` files in that directory. The backup files should be copied to a new directory named `backup` with a timestamp.

#### Solution
The code execution is as follows:
1. Takes the directory's absolute path. If it is invalid, throws and error to terminal.
2. Checks if the directory exists.
3. Gets the current timestamp.
4. Creates path of the backup file.
5. Finds all the files only in the first level of target directory.
6. Execute `cp` copy command to tarball.

## Question 3
Write a script that displays the following information about the user:

   - Username

   - User ID

   - Group ID

   - Home Directory

   - Shell being used

#### Solution
The solution steps are as follows:
1. Gets username using the `$whoami` command.
2. Gets User ID using the `id -u` command.
3. Gets Group ID using the `id -g` command.
4. Gets the home directory using the `$HOME` command.
5. Gets the default shell using the `$SHELL` command.

Screenshot:
![image](https://github.com/user-attachments/assets/9465b9d7-6158-42e7-a13a-aa12c58532da)

## Question 4
Write a script that checks the disk usage of the root filesystem. If the disk usage is above 80%, the script should send an email alert to the system administrator.

#### Solution
Execution steps are as follows:
1. Gets the system administrator email as user input.
2. Validate if the email is provided.
3. Get the disk usage using the `df` command. Search and get current disk usage using `awk` and `sed` commands.
4. If the threshold exceeds, send email with subject and message.

## Question 5
Write a script that takes a file as an argument and checks if the file has read, write, and execute permissions. The script should display appropriate messages for each permission.

#### Solution
Using the following flags using if-statements to check permissions: 
1. `-e` - Check if the file exists.
2. `-r` - Check if read permissions are provided.
3. `-w` - Check if write permissions are provided.
4. `-x-` - Check if execution permissions are provided.

## Question 6
Write a script that compresses the `/home/user/documents` directory into a tarball named `documents_backup.tar.gz` and moves it to the `/home/user/backup` directory. This script should be scheduled to run daily using cron.

#### Solution
The script execution is as follows:
1. Defines all directory destinations
2. Makes backup directory if it does not exist.
3. Creates tarball using `tar -czf`.
4. Verify if tarball was created or not.

## Question 7
Write a script that checks if a specific process (e.g., `apache2`) is running. If the process is not running, the script should start the process and log the action to a file.

#### Solution
Steps are as follows:
1. Reads for the process and checks if the process name is provided or not.
2. Checks if the process exists or not.
3. Logs process status in log file.

## Question 8
Write a script that takes a text file as an argument and counts the number of lines, words, and characters in the file. The script should display the counts.

#### Solution
A simple script which checks if file name is provided, then checks if the file exists or not using the `! -f` tag.
The following tags are used to check file details:
1. `wc -l` - lines in file
2. `wc -w` - word count
3. `wc -m` - character count

## Question 9
Write a script that generates a system information report. The report should include:

   - System uptime

   - Memory usage

   - CPU load

   - Disk usage

   - Running processes

The report should be saved to a file named `system_report.txt`.

#### Solution
The following flags are used to get system details:
1. `uptime -p` - Uptime info
2. `free -h` - Memory usage
3. `top -bn1`  CPU load
4. `df -h` - Disk usage
5. `ps -eo pid,comm,%mem,%cpu --sort=-%mem | head -n 11` - Running processes

## Question 10
Write a script that acts as a simple calculator. The script should prompt the user to enter two numbers and an operator (+, -, *, /) and then display the result of the operation.

#### Solution
A simple calculator bash script which takes users input for both numbers and then runs a calculate functions to execute mathematical operations.


## Additional Information
- Neovim Config: I use Neovim as my text editor. You can find my configuration here.
- Operating System: I'm using Linux Pop!_OS for all my development work.
