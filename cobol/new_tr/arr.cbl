       identification division.
       program-id. NAME.
       data division.
      
       linkage section.
       01  arr.
           05 arr-length     pic 99.
           05 xs             pic 99 occurs 0 to 20 times 
                                  depending on arr-length.
       01  result.
           05 res-length     pic 99.
           05 res            pic 99 occurs 0 to 20 times 
                                  depending on res-length.
      
       procedure division using arr result.
      
      * Your code here
      
           goback.
       end program NAME.
      
      
      
      
      
      
           testsuite 'Random tests'.
           perform set-random-seed
           perform 0 times
              compute arr-length = 21 * function random
              perform varying h from 1 until h > arr-length
                  compute xs(h) = 100 * function random
              end-perform
              perform dotest
      
      
      
      
      
      
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
       

      
       end program tests.
      

      
      
      
       string-to-arr.
           move 1 to i
           move 0 to arr-length
           perform with test after until x-delim = space
               unstring fixed-test 
                   delimited by ',' or space 
                   into x-str delimiter in x-delim
                   with pointer i
               add 1 to arr-length
               compute xs(exp-length) = function numval(x-str)
           end-perform
      
           perform dotest
           .
      
      
      
       shuffle-array.
           compute c = arr-length + 1
           perform until c = 1
                subtract 1 from c
                compute i = 1 + function random * c
                move xs(c) to n
                move xs(i) to xs(c)
                move n to xs(i)
          end-perform
          .
      
      
       generate-random-array.
           compute arr-length = min-length + 
                       function random * (max-length - min-length + 1)
           perform varying i from 1 by 1 until i > arr-length
               compute xs(i) = min + function random * (max - min + 1)
           end-perform
           .

      * Tests not displaying output
      
       identification division.
       program-id. tests.
      
       data division.
       working-storage section.
       01  items.
           05 items-length      pic 9(2).
           05 xs                pic 9(2)  occurs 5 to 30 times
                                          depending on items-length.
       01  a                    pic 9(2).
       01  b                    pic 9(2).
       01  result.
           05 res-length        pic 9(2).
           05 res               pic 9(2)  occurs 5 to 30 times
                                          depending on res-length.
       01  expected.
           05 xp-length         pic 9(2).
           05 xp                pic 9(2)  occurs 5 to 30 times
                                      depending on xp-length.
       01  j                    pic 99.
       01  i                    pic 99.
       01  check                pic 9.
       01  x-str                pic x(10).
       01  x-delim              pic x.
       01  fixed-test           pic x(100).
       01  fixed-exp            pic x(100).
       01  n-disp               pic z(9)9.
      
       procedure division.
           testsuite 'Fixed tests'.
           move '' to fixed-test
           move 3 to a
           move 5 to b
           move '' to fixed-exp
           perform string-to-arr
           perform dotest

      
           testsuite 'Random tests'.
           perform set-random-seed
           perform 100 times
             compute items-length = 5 + 26 * function random
             perform varying i from 1 until i > items-length
                compute xs(i) = 100 * function random
             end-perform
             compute a = 1 + (items-length - 3) * function random
             compute b = a + (items-length + 5) * function random
             perform reference-solution
             perform dotest
           end-perform
           end tests.
      
       string-to-arr.
           move 1 to i
           move 0 to items-length
           perform with test after until x-delim = space
               unstring fixed-test
                   delimited by ',' or space 
                   into x-str delimiter in x-delim
                   with pointer i
               add 1 to items-length
               compute xs(items-length) = function numval(x-str)
           end-perform
           
           move 1 to i
           move 0 to xp-length
           perform with test after until x-delim = space
               unstring fixed-exp
                   delimited by ',' or space 
                   into x-str delimiter in x-delim
                   with pointer i
               add 1 to xp-length
               compute xp(xp-length) = function numval(x-str)
           end-perform
           .
      
      
       dotest.
           testcase 'Testing'.
           
           initialize result
           call 'InverseSlice' using 
               by content items a b
               by reference result
           
           move 1 to check
           if res-length <> xp-length
              move 0 to check
              display 'Incorrect length of result:'
              move xp-length to n-disp
              display 'Expected ' function trim(n-disp)
              move res-length to n-disp
              display 'Actual   ' function trim(n-disp)
              perform display-input
           else
              perform varying i from 1 until i > xp-length
                if xp(i) <> res(i)
                    move i to n-disp
                    display 'Incorrect value at index '
                            function trim(n-disp)
                    move xp(i) to n-disp
                    display 'Expected: ' function trim(n-disp)
                    move res(i) to n-disp
                    display 'Actual:   ' function trim(n-disp)
                    move 0 to check
                    perform display-input
                    exit perform
                end-if
              end-perform
            end-if
            
            initialize assertion-message
            if check = 1 perform assert-true
            else         perform assert-false end-if
           .
      
      
       display-input.
           display 'xs = [' no advancing
           perform varying i from 1 by 1 until i > items-length
               move xs(i) to n-disp
               display function trim(n-disp) no advancing
               if i < items-length
                   display ', ' no advancing
               end-if
           end-perform
           display '], a = ' no advancing
           move a to n-disp
           display function trim(n-disp) ', b = ' no advancing
           move b to n-disp
           display function trim(n-disp)
           .
      
       reference-solution.

           .
      
       end program tests.
      
      * Test displaying arrays
       identification division.
       program-id. tests.
      
       data division.
       working-storage section.
       01  arr.
           05 arr-length     pic 99.
           05 xs             pic 99 occurs 0 to 20 times 
                                  depending on arr-length.
       01  result.
           05 res-length     pic 99.
           05 res            pic 99 occurs 0 to 20 times 
                                  depending on res-length.
       01  expected.
           05 xp-length     pic 99.
           05 xp             pic 99 occurs 0 to 20 times 
                                  depending on xp-length.
       01  j               pic 9(2).
       01  i               pic 9(2).
       01  check           pic 9.
       01  x-str           pic x(10).
       01  x-delim         pic x.
       01  l-disp          pic z(2)9.
       01  fixed-test      pic x(100).
       01  fixed-exp       pic x(100).
       01  n-disp          pic z(10)9.
      
       procedure division.
           testsuite 'Fixed tests'.
           move '' to fixed-test
           move '' to fixed-exp
           perform do-fixed-test

           move ' ' to fixed-test
           move ' ' to fixed-exp
           perform do-fixed-test
      
           end tests.
      
       do-fixed-test.
      * parse input
           if fixed-test = ' ' then move 0 to arr-length
           else
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
           end-if
      * parse expected
           if fixed-exp = ' ' then move 0 to xp-length
           else
               move 1 to i
               move 0 to xp-length
               perform with test after until x-delim = space
                   unstring fixed-exp 
                       delimited by ',' or space 
                       into x-str delimiter in x-delim
                       with pointer i
                   add 1 to xp-length
                   compute xp(xp-length) = function numval(x-str)
               end-perform
           end-if
      
           perform dotest
           .
      
       dotest.
           testcase 'Testing'.
           
           initialize result
           call '' using 
               by content arr
               by reference result
           move 1 to check
      
           if res-length <> xp-length
                move 0 to check
                display 'Incorrect length of result' line-feed
           else
                perform varying i from 1 until i > xp-length
                    if res(i) <> xp(i)
                      move 0 to check
                      display 'Result is incorrect' line-feed
                      exit perform
                    end-if
                end-perform
           end-if
      
           initialize assertion-message
      
           if check = 0 
                perform display-arrays
                perform assert-false
           else
               perform assert-true
           end-if
           .

       display-arrays.
           if arr-length = 0 then display 'arr = [ ]' line-feed
           else
               display 'arr = [' no advancing
               perform varying i from 1 by 1 until i > arr-length
                   move xs(i) to n-disp
                   display function trim(n-disp) no advancing
                   if i < arr-length
                       display ', ' no advancing
                   end-if
               end-perform
               display ']' line-feed
           end-if
      
           if res-length = 0 then display 'actual   = [ ]' line-feed
           else
               display 'actual   = [' no advancing
               perform varying i from 1 by 1 until i > res-length
                   move res(i) to n-disp
                   display function trim(n-disp) no advancing
                   if i < res-length
                       display ', ' no advancing
                   end-if
               end-perform
               display ']' line-feed
           end-if
      
           if xp-length = 0 then display 'expected = [ ]'
           else
               display 'expected = [' no advancing
               perform varying i from 1 by 1 until i > xp-length
                   move xp(i) to n-disp
                   display function trim(n-disp) no advancing
                   if i < xp-length
                       display ', ' no advancing
                   end-if
               end-perform
               display ']'
           end-if
           .
      
       end program tests.
   
