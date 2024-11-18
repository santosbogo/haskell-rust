module RunLengthEncoding (encode, encode2, Element(..)) where

--encode :: String -> [(Int, Char)]
--encode [] = []
--encode (c:word) =
--    let (prefix, rest) = span (== c) word
--    in (1 + length prefix, c)  : encode rest

encode :: String -> [(Int, Char)]
encode [] = []
encode (x : xs) = encode' 1 x xs

encode' :: Int -> Char -> String -> [(Int, Char)]
encode' n c "" = [(n, c)]
encode' n c (x : xs)
    | c == x = encode' (n+1) c xs
    | otherwise = (n, c) : encode' 1 x xs


data Element =  One  Char | Repeat Char Int deriving(Show, Eq)

encode2 :: String -> [Element]
encode2 word = [write c n | (n, c) <- encode word]

write :: Char -> Int -> Element
write c n
    | n == 1 = One c
    | otherwise = Repeat c n
