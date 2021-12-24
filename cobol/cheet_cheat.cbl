// ifelse https://www.codewars.com/kata/574b3b1599d8f897470018f6/solutions/cobol
// https://www.developpez.net/forums/d647072/autres-langages/autres-langages/cobol/z-os-fonctions-routines-service-enterprise-cobol-for-z-os/
// https://www.codewars.com/kata/5ab6538b379d20ad880000ab/solutions/cobol
// https://www.codewars.com/kata/523b623152af8a30c6000027/solutions/cobol
// elegant if else
// https://www.codewars.com/kata/580878d5d27b84b64c000b51/solutions/cobol
// perform
// https://www.codewars.com/kata/reviews/6182c7256d2f160001947817/groups/6182d811ffb9d0000160e671
// recursion
// https://stackoverflow.com/questions/27806812/in-cobol-is-it-possible-to-recursively-call-a-paragraph
// floats
// https://www.codewars.com/kata/5b0d67c1cb35dfa10b0022c7/solutions/cobol
// exit perform
// https://www.codewars.com/kata/reviews/618538caf715af0001a90c2a/groups/618570cf510b09000193610d
// loop
// https://zestedesavoir.com/tutoriels/685/la-programmation-cobol/739_les-bases-du-cobol/3403_les-boucles/#3-10670_boucle-avancee
      ceil
types:
      9: digits
      a: alphabetic
      x: alnum
Monadius:
      
      compute x rounded mode toward-greater = 

      initialize assertion-message
if function abs(expected - result) < 1.0e-9
   perform assert-true
else
   string result 
      ' should be approximately equal to '
      expected
    into assertion-message
   perform assert-false
end-if

      
      
PIC -(1)9. can hold one digit only. In general, PIC -(n)9. can hold n digits only. The extra symbol is reserved for the sign.
      
      
      
usage comp-5 corresponds to native integers
(that is, 64-bit integers on 64-bit machines).
You may declare all integer variables as usage comp-5 and get a noticeable performance improvement.
But GnuCOBOL does not perform computations directly with native integers.
It converts them to GMP decimals, performs computations, and the converts GMP decimals back to native integers.
That's why GnuCOBOL is slow even with usage comp-5.
      
      
      
      arrays
       01 arr.
         05 pic 9(8) value 1.
         ...
       01 xs redefines arr.
         05 num pic 9(8) occurs 18 times indexed by inx-a.

      
      
bitwise ops
      CBL_AND, CBL_OR, CLB_XOR, CLB_NOT, CBL_NIMP, CBL_NOR, CBL_IMP, CBL_EQ.
      
            array binary search https://www.codewars.com/kata/reviews/619d52279e40e60001b88738/groups/619d56566d2c6a0001d71c85

      
      char ord - string
      https://www.codewars.com/kata/565b9d6f8139573819000056/solutions/cobol
      
      
      
~~~if:cobol
blablablabla
~~~
