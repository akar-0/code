       identification division.
       program-id. BrainFuckInterpreter.
       author. akar-0.
       date-written.  12/31/2021.
       date-compiled. 12/31/2021.
       data division.
       working-storage section.
      * Will store the sanitized BF code
       01  prgrm.
           05  prog-length      pic 9(6).
           05  prg.
               07  prog        pic x   occurs 0 to 800000 times
                                       depending on prog-length
                                       indexed by ProgIndex.
       01  array.
           05  xs              pic 9(3) occurs 30000 times
                                        indexed by CellIndex.
       01 unmatched            pic 9(6).
      
       linkage section.
       01  BF-code.
           05 code-length     pic 9(5).
           05 it              pic x     occurs 0 to 99999 times 
                                        depending on code-length
                                        indexed by h.
       01  input-string.
           05 inp-length      pic 9(5).
           05 inp             pic x occurs 0 to 30000 times 
                                    depending on inp-length
                                    indexed by InputIndex.
       01  output-string.
           05 ErrorFound      pic a(5).
              88 error-found  value 'Error' when set to false 'Ok'.
           05 out-length      pic 9(5).
           05 out             pic x occurs 0 to 30000 times 
                                    depending on out-length.
      
       procedure division using BF-code input-string output-string.
                                                                                
      **********************************************************            
      *                     Brainfuck Interpreter              *                        
      **********************************************************   
      * Implementation of Donald Leung's JavaScript Brainfuck interpreter
      * Available: https://www.codewars.com/kata/585ddf096d36a5a143000178/javascript (see `Preloaded` section)
      * MIT License
      * https://opensource.org/licenses/mit-license.php
      
      
          set error-found to false
          initialize prgrm, array, output-string
          move 0 to out-length, InputIndex, prog-length
          move 1 to ProgIndex, CellIndex
      
      * write sanitized BF code to `prog`
          perform varying h from 1 until h > code-length
              evaluate it(h)
              when '<'
              when '>'
              when '+'
              when '-'
              when '.'
              when ','
              when '['
              when ']'
                      add 1 to prog-length
                      move it(h) to prog(prog-length)
            end-evaluate
          end-perform
      
          perform until ProgIndex > prog-length
              evaluate prog(ProgIndex)
              when '.'     perform write-to-output
              when ','     perform copy-to-cell
              when '+'     perform increment-cell
              when '-'     perform decrement-cell
              when '>'     perform point-to-next-cell
              when '<'     perform point-to-prev-cell
              when '['     perform skip-forward
              when ']'     perform skip-backward
      *       This should never happen since the code has been sanitized in the previous step
              when other   display 'INVALID PROGRAM'
                           perform crash
              end-evaluate
              add 1 to ProgIndex
          end-perform
      
          goback.
          
          write-to-output.
      *       Print the ASCII value at the current cell
              if xs(CellIndex) <> 0
                  add 1 to out-length
                  move function char(xs(CellIndex) + 1)
                       to out(out-length)
              end-if
              .

          copy-to-cell.
      *        Read one character of input into the current cell
              add 1 to InputIndex
              compute xs(CellIndex) = function ord(inp(InputIndex)) - 1
              .
      
          increment-cell.
      *      Increment the value at the current cell by 1.  If value exceeds 255 then loop back to 0
              move function rem(xs(CellIndex) + 1, 256) to xs(CellIndex)
              .
      
          decrement-cell.
      *      Decrement the value at the current cell by 1.  If value is inferior to 0 then loop back to 255
              move function mod(xs(CellIndex) - 1, 256) to xs(CellIndex)
              .
      
          point-to-next-cell.
              add 1 to CellIndex
      *       If the index of the cell is above 30000, stop the program and return an error
              if CellIndex > 30000
                  display 'Cell out of range (> 30000)'
                  perform crash
              end-if
              .
      
          point-to-prev-cell.
              subtract 1 from CellIndex
      *       if the index is below 1, stop the program and return an error
              if CellIndex < 1
                  display 'Cell out of range (< 1)'
                  perform crash
              end-if
              .
      
            skip-forward.
              if xs(CellIndex) = 0
      *           Unmatched bracket found.  Skip forwards in the BF program until the matching (closing) bracket is found
                  move 1 to unmatched
                  perform until unmatched = 0
      *               Jump to the next character in the BF program
                      add 1 to ProgIndex
      *               If index is out of bounds, stop the interpreter and return an error
                      if ProgIndex > prog-length
                          display 'Unmatched bracket "["'
                          perform crash
                      end-if
                      evaluate prog(ProgIndex)
      *               If the next character is also an opening bracket, there is one more unmatched bracket
                      when '['  add      1  to  unmatched
      *               If the next character is a closing bracket then there is one less unmatched bracket
                      when ']'  subtract 1 from unmatched
      *               Otherwise, keep jumping to the next character until the matching closing bracket is found
                      end-evaluate
                  end-perform
              end-if
              .
      
            skip-backward.
              if xs(CellIndex) <> 0
      *          Unmatched ending bracket found.  Read backwards in the BF program to find its matching opening bracket
                  move 1 to unmatched
                  perform until unmatched = 0
      *               Jump to the previous character in the BF program
                      subtract 1 from ProgIndex
      *               If index is out of bounds, stop the interpreter and return an error
                      if ProgIndex < 1
                          display 'Unmatched bracket "]"'
                          perform crash
                      end-if
                      evaluate prog(ProgIndex)
      *               If the next character is an ending bracket then there is one more unmatched bracket
                      when ']'  add      1  to  unmatched
      *               If the next character is an opening bracket then there is one less unmatched bracket
                      when '['  subtract 1 from unmatched
                      end-evaluate
      *               Otherwise, keep reading backwards in the BF program until the matching opening bracket is found
                  end-perform
              end-if
              .
      
            crash.
              set error-found to true
              goback
              .
      
       end program BrainFuckInterpreter.
