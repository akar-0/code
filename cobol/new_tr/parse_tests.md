```python
# Python script to parse fixed tests data from other language and format them for COBOL

# Array input or output

import re

s="""

"""

L=[]
for e in s.split('\n'):
    try:
        e=re.findall(r'-?\d+',e)
        n=e.pop()
    except:continue
    L.append(f"           move '{','.join(e)}' to fixed-test\n           move {n} to expected\n           perform do-fixed-test\n")


print('\n'.join(L))



# numbers 

import re

s="""

"""

L=[]
for e in s.split('\n'):
    try:
        a,b=re.findall(r'-?\d+\.?\d*',e)
    except: continue
    else: L.append(f"           move {a} to n\n           move {b} to expected\n           perform dotest")

print('\n'.join(L))


# script to parse a nested array with variable sized rows (e). 

e=[[1, 3, 5], [100], [2, 4, 6]]
a='           '
L=[f"{a}move {len(e)} to arr-length"]

for i,arr in enumerate(e,1):
    L.append(f"{a}move {len(arr)} to len({i})")
    for j,n in enumerate(arr,1):
        L.append(f"{a}move {n} to cell({i}, {j})")

L.append(f"{a}perform dotest\n")
print('\n'.join(L))

```

The previous code matches with COBOL declaration similar to the following (see kata "Flatten and sort an array"):
```cobol
       01  arr.
           05 arr-length     pic 9(2).
           05 rows occurs 0 to 256 times depending on arr-length.
              07 cell pic s9(4) occurs 256 times.
       01 rows-lengths.
          05 len pic 9(3) occurs 0 to 256 times depending on arr-length.
       01  result.
           05 res-length     pic 9(5).
           05 res            pic s9(4) occurs 0 to 30000 times 
                                       depending on res-length.
       01  expected.
           05 xp-length     pic 9(5).
           05 xp            pic s9(4) occurs 0 to 30000 times 
                                  depending on xp-length.

```

* Convert Python list to COBOL table:

```python
e=[]
a='           '
L=[f"{a}move {len(e)} to arr-length"]

for i,s in enumerate(e,1):
    L.append(f"{a}move '{str(s)}' to xs({i})")


L.append(f"{a}perform dotest\n")
print('\n'.join(L))

```
COBOL declaration:
```cobol
       01  arr.
           05 arr-length     pic 9(2).
           05 xs pic 9(2) occurs 0 to 99 times depending on arr1-length indexed i.
```

* Parse tests for "Assembler Interpreter (part II)"
```python
s='''
call  func1
call  print
end

func1:
    call  func2
    ret

func2:
    ret

print:
    msg 'This program should return -1'
'''
x="           "

def f(s,i):
    print(f"{x}move {len(s)} to progLen\n{x}string")
    for e in s.split('\n'):
        if not e:print(f"{x}lf")
        elif "'" not in e: print(f"{x}'{e}' lf")
        else:print(f"\n{x}q\n".join(f"{x}'{h}'" for h in e.split("'"))+' lf')
    else: print(f"           into progChars\n           move length of e{i} to eLen\n           move e{i} to eChars\n           set e-end to true\n           perform dotest")

print(f(s,2))
