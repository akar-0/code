      * solution
       IDENTIFICATION DIVISION.
       PROGRAM-ID. NAME.
       DATA DIVISION.
       LINKAGE SECTION.
       01 N           PIC 9(8).
       01 RESULT      PIC 9(20).
       PROCEDURE DIVISION USING N RESULT.
      
           COMPUTE RESULT =
      
           GOBACK.
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
           MOVE 0 TO N
           MOVE 0 TO EXPECTED
           PERFORM DOTEST
      
      
           TESTSUITE 'Random Tests'.
           PERFORM SET-RANDOM-SEED
           PERFORM 100 TIMES
               COMPUTE N = 100 * FUNCTION RANDOM
               COMPUTE EXPECTED = 
               PERFORM DOTEST
           END-PERFORM

           END TESTS.
      
       DOTEST.
           MOVE N TO N-DISP
           TESTCASE 'Testing: N = ' FUNCTION TRIM(N-DISP).
           INITIALIZE RESULT
           CALL 'NAME' USING BY CONTENT N BY REFERENCE RESULT
           EXPECT RESULT TO BE EXPECTED.
           .
       END PROGRAM TESTS.
