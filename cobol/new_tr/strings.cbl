       identification division.
       program-id. NAME.
       data division.
      
       linkage section.
       01  s.
           05 s-length     pic 9(2).
           05 s-char       pic x occurs 0 to 20 times 
                                  depending on arr-length.
       01  result.
           05 res-length     pic 9(2).
           05 res            pic x occurs 0 to 20 times 
                                   depending on res-length.
      
       procedure division using s result.
      
      * Your code here
      
          goback.
       end program NAME.
      
      
      
