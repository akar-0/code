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
