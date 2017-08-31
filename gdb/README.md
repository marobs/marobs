## GDB Usage
```
gdb ./<executable>
backtrace (bt)                    # Looks at all the stack frames on top of where you crashed
list <function>                   # Prints a function
frame                             # What stack frame am I currently looking at?
up                                # Goes up a stack frame
call <function(args)>             # Doesn't work so well if everything already dead!
run                               # Restarts the program
break <filename:linenum>          # Adds a breakpoint to file at line
break <file:line> if <CONDITION>  # Breaks on line in file ifcondition is met
continue                          # Continues execution after a break statement
info breakpoints                  # Displays all of the breakpoints
step                              # Step into the next line of code
next                              # Move over the line of code 
display <var>                     # Displays a variable whenever a break, etc. is reached

objdump -d <executable>           # Shows assembly-esque decompilation of program; with -g has additional info
```
