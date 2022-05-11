       identification division.
       program-id. NAME.
       data division.
       linkage section.
       01  arr.
           05  arrLength     pic 9(2).
           05  xs            pic 9(2) occurs 0 to 20 times 
                                      depending on arrLength.
       01  result.
           05  resLength     pic 9(2).
           05  res           pic 9(2) occurs 0 to 20 times 
                                      depending on resLength.
      
       procedure division using arr result.
      
          initialize result
      
          goback.
       end program NAME.
      
      
      
       identification division.
       program-id. tests.
      
       data division.
       working-storage section.
       01  i                 usage index.
       01  j                 usage index.
       01  x-str             pic x(10).
       01  x-delim           pic x.
       01  lDisp             pic z(9)9.
       01  fixedTest         pic x(100).
       01  fixedExp          pic x(100).
       01  nDisp             pic z(19)9.
      
       procedure division.
           testsuite 'Fixed tests'.
           move '' to fixedTest
           move 1 to expected
           perform doFixedTest

      
           testsuite 'Random tests'.
           perform set-random-seed
           perform 0 times

               perform doTest
           end-perform
           end tests.
      
       doFixedTest.
          move 0 to l el
          if fixedTest <> ' '
              set i to 1
              perform with test after until x-delim = space
                  unstring fixedTest 
                      delimited by ',' or space 
                      into x-str delimiter in x-delim
                      with pointer i
                  add 1 to l
                  compute xs(l) = function numval(x-str)
              end-perform
           end-if
      
          if fixedExp <> ' '
              set i to 1
              perform with test after until x-delim = space
                  unstring fixedExp 
                      delimited by ',' or space 
                      into x-str delimiter in x-delim
                      with pointer i
                  add 1 to el
                  compute e(el) = function numval(x-str)
              end-perform
           end-if
           perform doTest
           .
      
       doTest.
           move l to lDisp
           testcase 'Testing arrLength = ' function trim(lDisp).
           
           call 'NAME' using 
               by content arr
               by reference result
      
           initialize assertion-message
           if expected <> result
              perform assert-false
              perform displayArrays
           else
              perform assert-true
           end-if
           .
      
       displayArrays.
           if l = 0
              display 'arr = [ ]'
           else
             display 'arr = [' no advancing
               perform varying i from 1 until i > l
                 move xs(i) to nDisp
                 display function trim(nDisp) no advancing
                 if i < l display ', ' no advancing
                 else     display ']' end-if
             end-perform
           end-if
      
           if rl = 0
              display 'result   = [ ]'
           else
             display 'result   = [' no advancing
               perform varying i from 1 until i > rl
                 move r(i) to nDisp
                 display function trim(nDisp) no advancing
                 if i < rl display ', ' no advancing
                 else     display ']' end-if
             end-perform
           end-if
      
           if el = 0
              display 'expected = [ ]'
           else
             display 'expected = [' no advancing
               perform varying i from 1 until i > el
                 move e(i) to nDisp
                 display function trim(nDisp) no advancing
                 if i < el display ', ' no advancing
                 else     display ']' end-if
             end-perform
           end-if
           .
      
       end program tests.
      

      
      
      
      
      
      
      
      
      
      
      
      
       string-to-arr.
           move 1 to i
           move 0 to l
           perform with test after until x-delim = space
               unstring fixed-test 
                   delimited by ',' or space 
                   into x-str delimiter in x-delim
                   with pointer i
               add 1 to l
               compute xs(l) = function numval(x-str)
           end-perform
      
           perform dotest
           .
      
      
      
       shuffle-array.
         perform varying i from l by -1 until i = 0
           compute j = 1 + function random * i
           move xs(i) to n
           move xs(j) to xs(i)
           move n to xs(j)
          end-perform
          .
      
      
       generate-random-array.
           computel = min-length + 
                       function random * (max-length - min-length + 1)
           perform varying i from 1 until i > l
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
       01  j                    pic 9(2).
       01  i                    pic 9(2).
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
           perform varying i from 1 until i > items-length
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
           05 arr-length     pic 9(2).
           05 xs             pic 9(2) occurs 0 to 20 times 
                                  depending on arr-length.
       01  result.
           05 res-length     pic 9(2).
           05 res            pic 9(2) occurs 0 to 20 times 
                                  depending on res-length.
       01  expected.
           05 xp-length     pic 9(2).
           05 xp            pic 9(2) occurs 0 to 20 times 
                                  depending on xp-length.
       01  j                usage index.
       01  i                usage index.
       01  check            pic 9.
       01  x-str            pic x(10).
       01  x-delim          pic x.
       01  l-disp           pic z(2)9.
       01  fixed-test       pic x(100).
       01  fixed-exp        pic x(100).
       01  n-disp           pic z(10)9.
      
       procedure division.
           testsuite 'Fixed tests'.
           move '' to fixed-test
           move '' to fixed-exp
           perform do-fixed-test

           move ' ' to fixed-test
           move ' ' to fixed-exp
           perform do-fixed-test
      
      
      
           testsuite 'Random tests'.
           perform set-random-seed
           perform 0 times
              compute arr-length = 100 * function random
              perform varying i from 1 until i > arr-length
                compute xs(i) = 100 * function random
              end-perform
              perform referenceSolution
              perform dotest
            end-perform
           end tests.
      
       do-fixed-test.
           move 0 to xp-length, arr-length
           if fixed-test <> ' '
               move 1 to i
               perform with test after until x-delim = space
                   unstring fixed-test 
                       delimited by ',' or space 
                       into x-str delimiter in x-delim
                       with pointer i
                       add 1 to arr-length
                   compute xs(arr-length) = function numval(x-str)
                   end-perform
           end-if

           if fixed-exp <> ' ' 
               move 1 to i
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
           move arr-length to l-disp
           testcase 'Testing arr-length = ' function trim(l-disp).
           
           call '' using 
               by content arr
               by reference result
           move 1 to check
      
           initialize assertion-message
           if res-length <> xp-length
                move 0 to check
                move res-length to l-disp
                move xp-length to n-disp
                string 'Incorrect length of result' line-feed
                       'Expected: ' function trim(n-disp)
                       ', Actual: ' function trim(l-disp)
                into assertion-message
           else
                perform varying i from 1 until i > xp-length
                    if res(i) <> xp(i)
                      move 0 to check
                      string 'Incorrect result'
                      into assertion-message
                    end-if
                end-perform
           end-if
            
           if check = 0 
                perform display-arrays
                perform assert-false
           else
               perform assert-true
           end-if
           .

       display-arrays.
           if arr-length = 0 then display 'arr      = [ ]'
           else
               display 'arr      = [' no advancing
               perform varying i from 1 until i > arr-length
                   move xs(i) to n-disp
                   display function trim(n-disp) no advancing
                   if i < arr-length
                       display ', ' no advancing
                   end-if
               end-perform
               display ']'
           end-if
      
           if res-length = 0 then display 'actual   = [ ]'
           else
               display 'actual   = [' no advancing
               perform varying i from 1 until i > res-length
                   move res(i) to n-disp
                   display function trim(n-disp) no advancing
                   if i < res-length
                       display ', ' no advancing
                   end-if
               end-perform
               display ']'
           end-if
      
           if xp-length = 0 then display 'expected = [ ]'
           else
               display 'expected = [' no advancing
               perform varying i from 1 until i > xp-length
                   move xp(i) to n-disp
                   display function trim(n-disp) no advancing
                   if i < xp-length
                       display ', ' no advancing
                   end-if
               end-perform
               display ']'
           end-if
           .
      
       referenceSolution. 
      
          .
      
       end program tests.
   

      
      * display big arrays
       displayArray.
           evaluate l
           when 0
              display 'arr = [ ]'
           when > 100
              display 'Array too big to be displayed'
           when other
             display 'stt = [' no advancing
             perform varying i from 1 until i > l
                 move xs(i) to aDisp
                 display function trim(aDisp) no advancing
                 if i < l
                      display ', ' no advancing
                 else display ']' end-if
             end-perform
           end-evaluate
           .
      
      
      pairs
      https://www.codewars.com/kumite/61c64fd30fb2fe0056398526?sel=61c64fd30fb2fe0056398526
      https://www.codewars.com/kumite/61f28d4ae3436d000f308fc0?sel=61f4351424fe41003ed05e8b
