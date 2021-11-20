      * solution
       IDENTIFICATION DIVISION.
       PROGRAM-ID. NAME.
       DATA DIVISION.
       LINKAGE SECTION.
       01 N           PIC 9(8).
       01 RESULT      PIC 9(20).
       PROCEDURE DIVISION USING N RESULT.
      
           Compute result = ,
      
           Goback.
       END PROGRAM NAME.
      
      * tests
       IDENTIFICATION DIVISION.
       PROGRAM-ID. TESTS.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N           PIC 9(8).
       01 RESULT      PIC 9(20).
       01 EXPECTED    PIC 9(20).
       01 N-DISP      PIC Z(19)9.
       PROCEDURE DIVISION.
           TESTSUITE 'Fixed Tests'.
           Move 0 to n,
           Move 0 to expected,
           Perform DOTEST
      
      
           TESTSUITE 'Random Tests'.
           Perform SET-RANDOM-SEED
           Perform 100 times
               Compute N = 100 * function random
               Compute expected = 
               Perform DOTEST
           End-perform

           END TESTS.
      
       DOTEST.
           Move n to n-disp
           TESTCASE 'Testing: N = ' function trim(n-disp).
           Initialize result
           Call 'NAME'
               using by content n
               by reference result
           Expect result to be expected.
           .
       END PROGRAM TESTS.
