## Tmux Commands
```
# Start a new session
tmux ; tmux new ; tmux new-session

# Start a new session with the name 'mysession'
tmux new -s mysession

# Kill/delete session mysession
tmux kill-ses -t mysessions
tmux kill-session -t mysession

# Show all sessions
tmux ls ; tmux list-sessions

# Attach to last session
tmux a ; tmux at ; tmux attach ; tmux attach-session

# Attach to session with name mysession
tmux a -t mysession
tmux at -t mysession
tmux attach -t mysession
```

## Python venv
```
# Create a new virtual env in the current directory
python3 -m venv .

# Activate virtual environment
source bin/activate

# Install dependencies listed in REQUIREMENTS.txt
pip install -r REQUIREMENTS.txt

# Deactivate 
deactivate
```

## Shell commands
```
which [application]    # Gives location of application binary
file [filename]        # Tells the file type
[command] &            # Runs the specified application/command in the background
jobs                   # Lists current proccesses launched by terminal
kill [x]               # Stops job x
sleep [x]              # Sleeps the terminal the specified amount of time
ctrl-z                 # Quits sleep
fg                     # Pushes an application to the foreground of the terminal
bg                     # Pushes foreground to background
chmod u+x [filename]   # Grant extra permission to the user to execute the filename 
```

## Unix tools
```
tr                    # Replaces with character mapping
uniq                  # Collapses repeated lines. Lots of flags!
hexedit               # Allows you to edit the binary of a file
find                  # Find a certain file
        find . -name "filename"
```
