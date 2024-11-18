module RunLengthEncoding (encode, encode2, Element(..)) where

encode :: String -> [(Int, Char)]
encode [] = []
encode (c:word) =
    let (prefix, rest) = span (== c) word
    in (1 + length prefix, c)  : encode rest


data Element =  One  Char | Repeat Char Int deriving(Show, Eq)

encode2 :: String -> [Element]
encode2 word = [write c n | (n, c) <- encode word]

write :: Char -> Int -> Element
write c n
    | n == 1 = One c
    | otherwise = Repeat c n
