cvtsi2sd xmm0,rax
cvttsd2si  ebx, xmm0     ; convert with truncation (C-style cast)
cvtsd2si  ecx, xmm0    ; rounded to nearest integer (or whatever the current rounding mode is)
