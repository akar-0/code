strip :: String -> String
strip "" = ""
strip s | head s == ' ' = strip $ tail s
        | last s == ' ' = strip $ init s
        | otherwise = s
