
# apaga: Guttman method made easy with shred

```                                
  ____ _____  ____ _____ _____ _
 / __ `/ __ \/ __ `/ __ `/ __ `/
/ /_/ / /_/ / /_/ / /_/ / /_/ / 
\__,_/ .___/\__,_/\__, /\__,_/  
    /_/          /____/         
```
**apaga** is a simple shell script that shreds files by renaming them with a random string, overwriting them 35 times and finally deleting them. The random string does not contain spaces, underlines, single or double quotes.

## Installation
1. Download `apaga.sh` script.
2. Give execute permissions to the script by running `chmod +x apaga.sh`.
3. Add the script to a directory in your PATH to use it from anywhere - or just alias it!

## Usage
```
apaga -f file -s size
```

## Options
- `-h`: Show the help message.
- `-f`: Specify the target file to shred.
- `-s`: Specify the size of the random string for renaming (default: 8, max: 16).
