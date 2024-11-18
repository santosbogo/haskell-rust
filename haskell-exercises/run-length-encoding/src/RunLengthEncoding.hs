module RunLengthEncoding (encode) where

encode:: String -> [(Int, Char)]
encode [] = []
encode (s:string) =
    let (prefix, rest) = span (== s) string
    in (1 + length prefix, s)  : encode rest
