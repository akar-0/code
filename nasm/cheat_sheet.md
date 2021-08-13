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
avant de faire une division....

* sqrt: sqrtsd xmm0, xmm0
* int to float: cvtsi2sd xmm0,rax
*  move a int32 into an int64:  movsx rax, ebx ( https://www.codewars.com/kata/5a2be17aee1aaefe2a000151/solutions )
