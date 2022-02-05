      
       identification division.
       program-id. displayMatrix.
       data division.
       local-storage section.
       01  n-disp            pic -(19)9.
      
       linkage section.
       01  matrix.
           05 l     pic 9.
           05 row occurs 0 to 8 times depending on l.
              07 xs  pic s9(2) occurs 8 times indexed i j.
      
       procedure division using matrix.
      
           if l = 0
              display 'matrix = [ ]'
           else
             display 'matrix = [' no advancing
               perform varying i from 1 until i > l
                 display '[' no advancing
                 perform varying j from 1 until j > l
                   move xs(i, j) to n-disp
                 display function trim(n-disp) no advancing
                 if j < l display ', ' no advancing end-if
                 end-perform display ']' no advancing
                 if i < l display ', ' no advancing end-if
             end-perform
             display ']'
           end-if
      
          goback.
       end program displayMatrix.
      
