      * abort
               dotest.
               move n to n-disp
               testcase 'Testing: n = ' function trim(n-disp).
               initialize result
               call 'fun' using by content n by reference result
               if result = expected
                  move 'test passed' to assertion-message
                  perform assert-true
               else
                  initialize assertion-message
                  string 'Incorrect value for n = 'function trim(n-disp)
                    into assertion-message
                  perform assert-false
                  perform end-test-group
                  goback
               end-if
               .
      
      * personalized message
               initialize assertion-message
               if result = expected
                   perform assert-true
               else
                   string {your message here}
                     into assertion-message
                   perform assert-false
               end-if

