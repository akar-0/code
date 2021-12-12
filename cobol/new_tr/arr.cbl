       identification division.
       program-id. NAME.

       data division.
       local-storage section.
       ...

      
       linkage section.
       01  arr.
           05 arr-length   pic 9(3).
           05 xs           pic 9(10) occurs 0 to 100 times 
                                     depending on arr-length.
       01  result          pic 9.

       procedure division using arr result.

      
      
           goback.
       end program NAME.
      
      
      
      
      
      
       identification division.
       program-id. tests.
      
       data division.
       working-storage section.
       01  min-val        pic 9(8).
       01  max-val        pic 9(8).
       01  min-length     pic 9(3).
       01  max-length     pic 9(3).
       01  j              pic 99.
       01  x-str          pic x(10).
       01  x-delim        pic x.
       01  l-disp         pic z(9)9.
       01  fixed-test     pic x(100).
       01  n-disp         pic z(19)9.
      
       procedure division.
           testsuite 'Fixed tests'.
           move '0,0,0,1' to fixed-test
           move 1 to expected
           perform do-fixed-test

      
           testsuite 'Random tests'.
           perform set-random-seed
           perform 0 times
               compute arr-length = 101 * function random
               perform generate-random-array
               perform reference-solution

               perform dotest
           end-perform
           end tests.

       do-fixed-test.
           move 1 to i
           move 0 to arr-length
           perform with test after until x-delim = space
               unstring fixed-test 
                   delimited by ',' or space 
                   into x-str delimiter in x-delim
                   with pointer i
               add 1 to arr-length
               compute xs(arr-length) = function numval(x-str)
           end-perform
      
           perform dotest
           .
      
       dotest.
           move arr-length to l-disp
           testcase 'Testing arr-length = ' function trim(l-disp).
           
           initialize result
           call 'NAME' using 
               by content arr
               by reference result
      
           if expected <> result then perform display-array end-if
      
           expect result to be expected.
           .
      
       display-array.
           display 'xs = [' no advancing
           perform varying i from 1 by 1 until i > arr-length
               move xs(i) to n-disp
               display function trim(n-disp) no advancing
               if i < arr-length
                   display ', ' no advancing
               end-if
           end-perform
           display ']'
           .

       generate-random-array.
           compute arr-length = min-length + 
                       function random * (max-length - min-length + 1)
           perform varying i from 1 by 1 until i > arr-length
               compute xs(i) = min + function random * (max - min + 1)
           end-perform
           .
      
       end program tests.
      
