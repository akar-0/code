| 64 bit | 32 bit | 16 bit | low 8 bit | high 8 bit | infos |
|--------|--------|--------|-----------|------------|-----------------------|
| rax    |  eax   |  ax  | al | ah | |
| rbx    |  ebx   | bx   | bl | bh | |
| rcx    |  ecx   | cx   | cl | ch | |
| rdx    |  edx   | dx   | dl | dh | third function argument - holds remainder in integer division |
|  rsi   | esi | si | sil | none| second function argument |
| rdi | edi | di | dil | none | first function argument |
| rbp | ebp | bp | bpl | none| base pointer|
| rsp | esp | sp | spl | none | stack pointer |
| r8 | r8d | r8w | r8b | none | same until r15|
|rip|eip|?|?|?|control flow pointer|


r10,r9,r8 hold the 4th, 5th and 6th argument function.
