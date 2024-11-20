module Parcial (encode) where
import Data.Char (toLower, isAlpha)

-- 1 Run Length Encoding
encode :: String -> [(Int, Char)]
encode [] = []
encode (x:xs) = encode' 1 x xs

encode' :: Int -> Char -> String -> [(Int, Char)]
encode' n c [] = [(n, c)]
encode' n c (x:xs)
    | c == x = encode' (n+1) c xs
    | otherwise = (n, c) : encode 1 x xs


-- 2 Run Length Encoding with list comprehension
data Element = One Char | Repeat Char Int deriving(Show, Eq)

encode2 :: String -> [Element]
encode2 word = [ write n c | (n, c) <- encode word]

write :: Int -> Char -> Element
write n c
    | n == 1 = One c
    | otherwise = Repeat c n

-- 3 Student grade Average

-- a Implement record student
data Student = Student {idNumber :: Int, name :: String } deriving(Show, Eq)

-- b function for grade average
averageScores :: [(Int, Int)] -> Map Int Double
averageScores scores = Map.map average studentScores
        where studentScores = foldr insertScore Map.empty scores

insertScore :: (Int, Int) -> Map Int [Int] -> Map Int [Int]
insertScore (studentId, score) m = Map.insertWith (++) studentId [score] m

average :: [Int] -> Double
average xs = fromIntegral (sum xs) / fromIntegral (length xs)

-- c function that returns grade as a string or "No Show"
scoreAsString :: Int -> Map Int Double -> String
scoreAsString id scores =
    case Map.lookup id scores of
        Just grade -> show grade
        Nothing -> "No Show"

-- d print results
printAverages :: [Student] -> Map Int Double -> IO()
printAverages [] _ = return ()
printAverages (s:students) scores = do
    putStrLn (name s ++ " " ++ scoreAsString (idNumber x) m)
    printAverages students scores
