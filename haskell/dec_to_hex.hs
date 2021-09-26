decToHex :: Int -> String
decToHex n | n < 16 = [s!!n]
           | otherwise = (decToHex q) ++ [s!!r]
            where
            s = "0123456789abcdef"
            (q,r) = divMod n 16    
