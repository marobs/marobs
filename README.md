# Shell commands:
```
which [application] 			
file [filename]       # Tells the file type
[command] &           # Runs the specified application/command in the background
jobs                  # Lists current proccesses launched by terminal
kill [x]              # Stops job x
sleep [x]             # Sleeps the terminal the specified amount of time
ctrl-z                # Quits sleep
fg                    # Pushes an application to the foreground of the terminal
bg                    # Pushes foreground to background
chmod u+x [filename]  # Grant extra permission to the user to execute the filename 
```

## Unix tools
```
tr                    # Replaces with character mapping
uniq                  # Collapses repeated lines. Lots of flags!
hexedit               # Allows you to edit the binary of a file
find                  # Find a certain file
        find . -name "filename"
```

## Git Commands:
```
git init                 # Initialize a git repo
git status               # Is love, is life
git add <filename>       # Adds a file to the staging area 
git commit
git checkout <filename>  # Pulls the latest version of the file from the git repo
git add -p               # Split possible additions into hunks
git fsck                 # git filecheck. Can recover lost commits, files, etc.
```
