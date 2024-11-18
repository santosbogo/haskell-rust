module Lists (member, union, intersection, difference,
              insert, insertionSort, firsts,
              binaryToDecimal, toDecimal, toDec,binaryAdd)
              where
  
import Data.Char(digitToInt, intToDigit)

member:: Int -> [Int] -> Bool
member _ []      = False
member e (x:xs)  = e == x || member e xs


union:: [Int] -> [Int] -> [Int]
union [] ys     = ys
union (x:xs) ys 
  | member x ys = union xs ys
  | otherwise   = x : union xs ys

intersection:: [Int] -> [Int] -> [Int]
intersection [] ys = []
intersection (x: xs) ys
    | x `member` ys = x : intersection xs ys
    | otherwise = intersection xs ys

difference:: [Int] -> [Int] -> [Int]
difference [] ys = []
difference (x : xs) ys
    | not $ x `member` ys = x : difference xs ys
    | otherwise = difference xs ys

insert:: Int -> [Int] -> [Int]
insert n [] = [n]
insert n (x : xs)
    | n <= x = n : x : xs
    | otherwise = x : insert n xs

insertionSort :: [Int] -> [Int]
insertionSort [] = []
insertionSort (x : xs) = insert x (insertionSort xs)

binaryToDecimal :: [Int] -> Int
binaryToDecimal bits = sum [bit * 2^i | (bit, i) <- zip (reverse bits) [0..]]
    
toDecimal :: Int -> [Int] -> Int
toDecimal base digits = sum [digit * base^i | (digit, i) <- zip (reverse digits) [0..]]
    
toDec::Int -> String -> Int
toDec base s = sum [digit * base^i | (digit, i) <- zip (reverse [digitToInt c | c <- s]) [0..]]

firsts::[a] -> [[a]]
firsts list = [take n list | n <- [1..length list]]

-- Given two String that represents numbers in binary implement the 'binaryAdd' function
-- DO NOT USE a predefined '+' operation

binaryAdd :: String -> String -> String
binaryAdd a b = map intToDigit (reverse (add xa xb 0))
	where
				xa = reverse (map digitToInt a)
				xb = reverse (map digitToInt b)

add :: [Int] -> [Int] -> Int -> [Int]
add [] [] c = [c]
add a [] c = add a [0] c
add [] b c = add [0] b c
add (a:as) (b:bs) c = result : add as bs carry
	where
				result = (a + b + c) `mod` 2
				carry = (a + b + c) `div` 2
