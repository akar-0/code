decToBin :: Int -> [Int]
decToBin n | n < 2     = [n]
           | otherwise = (decToBin q) ++ [r] where (q,r) = divMod n 2
