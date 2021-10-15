flat x | null x = []
       | otherwise = (head x) ++ (flat $ tail x)
