       identification division.
       program-id. iSqrt.
      
       data division.
       local-storage section.
       01  y           pic 9(10).
      
       linkage section.
       01  n      pic 9(10).
       01  x      pic 9(10).
      
       procedure division using n x.
          
      * Compute the integer square root of an integer using Newton's method
      
          move n to x
          compute y = (x + 1) / 2
          
          perform until y >= x
              move y to x
              compute y = (x + n / x) / 2
          end-perform
      
          goback.
       end program iSqrt.
      
