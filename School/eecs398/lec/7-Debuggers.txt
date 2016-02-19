Debuggers are not some magical tool -- still requires you to know how to use them!

Debugging and compilation
  Debug with the -g flag
  Adds a bunch of information to the assembly that can be harnessed by a debugger
  
GDB
  Works with the OS to allow a program to be halted
  Can look at all of the state in the world -- registers, memeory, etc.
  Simple program -- powerful primitives
    Can modify registers
    Can make stack frames
  In backtrace, can call functions like you just paused execution
    print a
    print *b
    print a / *b
    set *b = 1
    print /u <num> # print as unsigned
  Can only reference variables in the current stack frame 
  

GDB Usage
  gdb ./<executable>
  backtrace (bt)					# Looks at all the stack frames on top of where you crashed
  list <function>					# Prints a function
  frame								# What stack frame am I currently looking at?
  up								# Goes up a stack frame
  call <function(args)>				# Doesn't work so well if everything already dead!
  run								# Restarts the program
  break <filename:linenum>			# Adds a breakpoint to file at line
  break <file:line> if <CONDITION>  # Breaks on line in file ifcondition is met
  continue							# Continues execution after a break statement
  info breakpoints					# Displays all of the breakpoints
  step								# Step into the next line of code
  next								# Move over the line of code 
  display <var>						# Displays a variable whenever a break, etc. is reached
  
    

objdump -d <executable>				# Shows assembly-esque decompilation of your program.
									# If run with a compile with -g, has additional info


