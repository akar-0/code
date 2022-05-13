       identification division.
       program-id. gcd.
       data division.
       local-storage section.
       01 c           pic 9(10).
       linkage section.
       01 a           pic 9(10).
       01 b           pic 9(10).
       01 result      pic 9(10).
       procedure division using a b result.
           perform until b = 0
              move b to c
              compute b = function mod(a, b)
              move c to a
           end-perform
           move a to result.
      
       end program gcd.
