## Python examples
#### File I/O
```python
with open(FILENAME, 'r/w/a (b+)') as f:
	linelist = [line.rstrip() for line in f]
	f.write(OUTPUTSTRING)
```
