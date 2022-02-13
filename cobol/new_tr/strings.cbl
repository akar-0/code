       identification division.
       program-id. NAME.
       data division.
       local-storage section.
       ...
      
       linkage section.
       01  s.
           05 sLen         pic 9(2).
           05 sChar        pic x occurs 0 to 20 times 
                                  depending on sLen.
       01  result.
           05 resLen       pic 9(2).
           05 res          pic x occurs 0 to 20 times 
                                 depending on resLen.
      
       procedure division using s result.
      
          initialize result
      
          goback.
       end program NAME.
      
      
      

      * tests
       identification division.
       program-id. tests.
      
       data division.
       working-storage section.
       01  s.
           05  sLen         pic 9(2).
           05  sChars.
              07  sChar     pic x occurs 0 to 20 times 
                                  depending on sLen.
       01  result.
           05  resLen       pic 9(2).
           05  resChars.
               07 resChar   pic x occurs 0 to 20 times 
                                  depending on resLen.
       01  expected.
           05  eLen         pic 9(2).
           05  eChars.
               07 eChar     pic x occurs 0 to 20 times 
                                 depending on eLen.
       01  i usage index.
       01  j usage index.
       01  s1 constant ''.
       01  e1 constant ''.
       01  s2 constant ''.
       01  e2 constant ''.
       01  s3 constant ''.
       01  e3 constant ''.
       01  s4 constant ''.
       01  e4 constant ''.
       01  s5 constant ''.
       01  e5 constant ''.
       01  s6 constant ''.
       01  e6 constant ''.
       01  r-disp            pic z(10)9.
       01  e-disp            pic z(10)9.
      
       procedure division.
           testsuite 'Fixed tests'.
           move length of s1 to sLen
           move s1 to eChars
           move length of e1 to eLen
           move e1 to eChars
           perform dotest
           
      
           testsuite 'Random tests'.
           perform set-random-seed
           perform 0 times
              compute eLen = 100 * function random
              move 0 to eLen
              perform varying i from 1 until i > sLen
                move function char(33 + function integer
                                  (95 * function random))
                     to sChar(i)
              end-perform
              perform dotest
            end-perform
           end tests.
      
       dotest.
           if sLen > 86
             move sLen to r-disp
             testcase 'Testing string of length ' function trim(r-disp).
            else 
             testcase 'Testing s = "' sChars '"'.
            end-if
           
           call 'NAME' using 
               by content s
               by reference result
      
           if resLen <> eLen
                move resLen to r-disp
                move eLen to e-disp
                initialize assertion-message
                string 'Incorrect length of result: expected '
                        function trim(e-disp) ', actual '
                        function trim(r-disp)
                into assertion-message
                perform assert-false
           else
                expect resChars to be eChars.
           end-if
           .
      
       end program tests.
   
