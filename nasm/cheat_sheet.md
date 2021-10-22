## Registers

| 64 bit | 32 bit | 16 bit | low 8 bit | high 8 bit | infos |
|--------|--------|--------|-----------|------------|-----------------------|
| rax    |  eax   |  ax  | al | ah | |
| rbx    |  ebx   | bx   | bl | bh | |
| rcx    |  ecx   | cx   | cl | ch | |
| rdx    |  edx   | dx   | dl | dh | third function argument - holds **remainder in integer division** |
|  rsi   | esi | si | sil | none| second function argument |
| rdi | edi | di | dil | none | first function argument |
| rbp | ebp | bp | bpl | none| base pointer|
| rsp | esp | sp | spl | none | stack pointer |
| r8 | r8d | r8w | r8b | none | same until r15|
|rip|eip|?|?|?|control flow pointer|

## Arguments
* 1:  RDI
* 2: RSI
* 3:  RDX
* 4: RCX
* 5:  R8
* 6:  R9

then stack...

```nasm
xor rdx, rdx
```
before div/idiv....

* sqrt: sqrtsd xmm0, xmm0

*  move a int32 into an int64:  movsx rax, ebx ( https://www.codewars.com/kata/5a2be17aee1aaefe2a000151/solutions )
*  [test](https://en.wikipedia.org/wiki/TEST_(x86_instruction))
* dword = double word =  int32
* qword = quadword = int64

## Conversions
* [doc](https://docs.oracle.com/cd/E19120-01/open.solaris/817-5477/epmsr/index.html)
* int to float: cvtsi2sd xmm0,rax
* float to int: [CW](https://www.codewars.com/kata/5a805d8cafa10f8b930005ba/solutions/nasm)
* clear float: pxor xmm0,xmm0

## floats
* mulsd xmm1, xmm2
* comisd xmm1, xmm0 
* ja(e) / jb(e)

## test parity
* test eax,1
* jz _even

## 2^n
* xor rax,rax
* bts rax,10 (??? rax = 2^10)
 
 ## test zero
 * test rax,rax
 * jz/jnz blabla
 
