-- https://www.codewars.com/kata/57a6633153ba33189e000074/solutions/haskell
-- https://www.codewars.com/kata/585a033e3a36cdc50a00011c/solutions/haskell
-- https://www.codewars.com/kata/56582133c932d8239900002e/solutions/haskell
-- https://www.codewars.com/kata/55d2aee99f30dbbf8b000001/solutions/haskell
-- https://www.codewars.com/kata/57a6633153ba33189e000074/solutions/haskell
-- ??
-- https://www.codewars.com/kata/51e056fe544cf36c410000fb/solutions/haskell

import qualified Data.HashMap.Strict as HMap

counter = HMap.fromListWith (+) $ zip a (repeat 1)
-- array of tuples
c = map (\c -> (c, counter HMap.! c)) $ nub a
