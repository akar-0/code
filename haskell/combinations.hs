-- cartesian product
-- https://www.codewars.com/kata/5d0365accfd09600130a00c9/solutions/haskell
[(x,y) | x <- xs, y <- ys]
prod a b = [[x,y] | x <- a, y <- b]

import Data.List
import Data.Ord
combinations = (. subsequences) . filter . (. length) . (==)

--combinations
-- https://stackoverflow.com/questions/52602474/function-to-generate-the-unique-combinations-of-a-list-in-haskell/52605612
-- https://www.codewars.com/kata/577e694af5db624cf30002d0/solutions/haskell
-- https://www.codewars.com/kata/54492291ec342c4a440008c5/solutions/haskell
-- permutations
-- https://www.codewars.com/kata/5b8be3ae36332f341e00015e/solutions/haskell
-- subsequences
-- https://www.codewars.com/kata/59eb64cba954273cd4000099/solutions/haskell
perm n = concat $ map(\i -> map(\j -> (i,j)) $ filter(/=i) [0..n-1]) [0..n-1]
