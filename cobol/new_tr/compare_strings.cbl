           evaluate true
               when res-chars = xp-chars
                 initialize assertion-message
                 if res-length <> xp-length
                   move res-length to a-disp
                   move xp-length to b-disp
                   string 'Expected and actual have different lengths' 
                      line-feed
                      'expected: ' function trim(b-disp)
                      line-feed
                      'actual:   ' function trim(a-disp)
                       into assertion-message
                   perform assert-false
                else
                   perform assert-true
                end-if
               when other
                   expect res-chars to be xp-chars.
           end-evaluate   
           
