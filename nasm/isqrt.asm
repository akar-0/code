;    int isqrt(int n) ;
;    n := edi


global isqrt

section .text

isqrt:
    cmp edi, 0
    jl _retFalse
    cmp edi, 3
    jl _retTrivial
    ;  compute isqrt(n)
    ;  hardware algorithm (from original C code in `Hacker's delight` by H.S Wawrren Jr., Addison Wesley, 2013, 2nd ed., p. 286)
    mov eax, edi           ; x
    xor ecx, ecx           ; y   (isqrt at the end of the algorithm)
    mov edx, 0x40000000    ; m
_loop:
    test edx, edx          ; until m = 0
    jz _endisqrt
    mov r8d, ecx           ; b = y
    or r8d, edx            ; b = y | m
    shr ecx, 1             ; y >>= 1
    cmp eax, r8d           ; if x >= b
    jl _next
    sub eax, r8d           ; x -= b
    or ecx, edx            ; y |= m
_next:
    shr edx, 2             ; m >>= 2
    jmp _loop
_endisqrt:
    mov eax, ecx
    ret
_retFalse:
    mov eax, -1
    ret
_retTrivial:
    mov eax, edi
    ret


; --------------------------------------------------------------------

section .text

isqrt:  
    cmp rdi, 3
    jl .retTrivial
    ;  compute isqrt(n)
    ;  hardware algorithm (from original C code in `Hacker's delight` by H.S Wawrren Jr., Addison Wesley, 2013, 2nd ed., p. 286)
    mov rax, rdi           ; x
    xor rcx, rcx           ; y   (isqrt at the end of the algorithm)
    mov rdx, 0x40000000    ; m
.loop:
    test rdx, rdx          ; until m = 0
    jz .endisqrt
    mov r8, rcx           ; b = y
    or r8, rdx            ; b = y | m
    shr rcx, 1             ; y >>= 1
    cmp rax, r8           ; if x >= b
    jl .next
    sub rax, r8           ; x -= b
    or rcx, rdx            ; y |= m
.next:
    shr rdx, 2             ; m >>= 2
    jmp .loop
.endisqrt:
    mov rax, rcx
    ret
.retFalse:
    mov rax, -1
    ret
.retTrivial:
    mov rax, rdi
    ret
