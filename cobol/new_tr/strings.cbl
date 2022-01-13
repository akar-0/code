       identification division.
       program-id. NAME.
       data division.
       local-storage section.
       ...
      
       linkage section.
       01  s.
           05 s-length     pic 9(2).
           05 s-char       pic x occurs 0 to 20 times 
                                  depending on s-length.
       01  result.
           05 res-length   pic 9(2).
           05 res          pic x occurs 0 to 20 times 
                                 depending on res-length.
      
       procedure division using s result.
      
      * Your code here
      
          goback.
       end program NAME.
      
      
      

      * tests
       identification division.
       program-id. tests.
      
       data division.
       working-storage section.
       01  c pic x.
       01  s.
           05  s-length      pic 9(2).
           05  s-chars.
               07 s-char     pic x occurs 0 to 30 times 
                             depending on s-length.
       01  result.
           05  res-length    pic 9(2).
           05  res-chars.
              07 res         pic x occurs 0 to 30 times 
                             depending on res-length.
       01  expected.
           05  xp-length     pic 9(2).
           05  e-chars.
              07  xp         pic x occurs 0 to 30 times 
                             depending on xp-length.
       01  i usage index.
       01  j usage index.
       01  s1 constant ''.
       01  e1 constant ''.
       01  r-disp            pic z(10)9.
       01  e-disp            pic z(10)9.
      
       procedure division.
           testsuite 'Fixed tests'.
           move length of s1 to s-length
           move s1 to s-chars
           move length of e1 to xp-length
           move e1 to e-chars
           perform dotest
      
           testsuite 'Random tests'.
           perform set-random-seed
           perform 0 times
              compute s-length = 100 * function random
              move 0 to xp-length
              perform varying i from 1 until i > s-length
                move function char(33 + function integer
                                  (95 * function random))
                     to c
              end-perform
              perform dotest
            end-perform
           end tests.
      
       dotest.
           if s-length > 86
             move s-length to r-disp
             testcase 'Testing string of length ' function trim(r-disp).
            else 
             testcase 'Testing s = "' s-chars '"'.
            end-if
           
           initialize result
           call 'NAME' using 
               by content s
               by reference result
      
           if res-length <> xp-length
                move res-length to r-disp
                move xp-length to e-disp
                initialize assertion-message
                string 'Incorrect length of result: expected '
                        function trim(e-disp) ', actual '
                        function trim(r-disp)
                into assertion-message
                perform assert-false
           else
                expect res-chars to be e-chars.
           end-if
           .
      
       end program tests.
   
