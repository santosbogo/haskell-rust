module Parcial (isPalindrome) where
import Data.Char (toLower, isAlpha)

-- 1 Palindrome
isPalindrome :: String -> Bool
isPalindrome [] = True
isPalindrome word = isPalindrome' cleanWord (reverse cleanWord)
    where cleanWord = map toLower (filter isAlpha word)

isPalindrome' :: String -> String -> Bool
isPalindrome' [] [] = True
isPalindrome' (x:xs) (y:ys)
    | x == y = isPalindrome' xs ys
    | otherwise = False

-- 2 Filter and Map using List comprehension
filterMap :: (a -> Maybe b) -> [a] -> [b]
filterMap f xs = [b | x <- xs, Just b <- [f x]]

-- 3 Tree
data Tree a = Leaf a | Node (Tree a) a (Tree a)

left :: Tree a -> Maybe (Tree a)
left (Node l _ _) = Just (Tree a)
left _ = Nothing

right :: Tree a -> Maybe (Tree a)
right (Node _ _ r) = Just (Tree a)
right _ = Nothing

value :: Tree a -> a
value (Leaf a) = a
value (Node _ v _) = v

-- 3.2 Tree an instance of Show paglia
instance Show a => Show (Tree a) where
  show (Leaf x) = show x
  show (Node l v r) = "(" ++ show l ++ " " ++ show v ++ " " ++ show r ++ ")"

-- 3.3 Tree an instance of Functor
instance Functor Tree where
    fmap f (Leaf x) = Leaf (f x)
    fmap f (Node l x r) = Node (fmap f l) (f x) (fmap f r)

-- 3.4 Tree an instance of Monad
instance Monad Tree Where
    return x            = Leaf x
    (Leaf x) >>= f      = f x
    (Node l x r) >>= f  = Node (l >>= f) y (r >>= f)
        where (Leaf y) = f x

-- 3.5 Examples of using the monad
let aTree = Node (Node (Leaf 1) 2 (Leaf 3)) 4 (Leaf 5)

let example1 = aTree >>= (\x -> if x == 3 then Leaf x else Leaf 0)
let example2 = aTree >>= (\x -> if x == 4 then Node (Leaf 0) x (Leaf 0) else Leaf 0)




