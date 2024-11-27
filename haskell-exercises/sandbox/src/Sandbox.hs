module Sandbox () where


--LIST COMPREHENSIONS
--[ expression | generators | filters ]

squares = [n*n | n <- [1..10]]
--[1,4,9,16,25,36,49,64,81,100]

multiplesOf7 = take 10 [e | e <- [1..], e `mod` 7 == 0]
--[7,14,21,28,35,42,49,56,63,70]

chess_board = [l : show n | l <- ['A'..'H'], n <- [1..8]]

--HIGH ORDER FUNCTIONS
applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

square x = x*x

doubleSquareOf3 = applyTwice square 3
--81

--Map
sum2ToAll = map (+2) squares

--Filter
biggerThan10 = filter (>10) sum2ToAll
biggerThan10SmallerThan50 = filter (\x -> x>10 && x<50) sum2ToAll

--Folds
sumAll = foldr (+) 0 [1..4]

subFromRight = foldr (-) 0 [1..4]
--(1-(2-(3-(4-0)))) = -2
subFromLeft = foldl (-) 0 [1..4]
--((((0-1)-2)-3)-4) = -10

--TYPES
data Weekday = Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday
    deriving (Eq, Ord, Show, Read, Enum)

isWeekend :: Weekday -> Bool
isWeekend Sunday   = True
isWeekend Saturday = True
isWeekend _        = False

--Using Eq
isWeekend2 :: Weekday -> Bool
isWeekend2 w = w == Sunday || w == Saturday

--Using Ord
isSooner :: Weekday -> Weekday -> Bool
isSooner w1 w2 = w1 < w2

--Using Show
printWeekday :: Weekday -> IO ()
printWeekday w = putStrLn (show w)

--Using Read
stringToWeekday :: String -> Weekday
stringToWeekday s = read s :: Weekday

--Using Enum
monday = succ Sunday
thursday = pred Friday
two = fromEnum Tuesday
numberToWeekday = (toEnum 2) :: Weekday

--Data with constructors
data Point = Pt Double Double deriving (Eq, Show)
origin = Pt 0 0

distance :: Point -> Point -> Double
distance (Pt x1 y1) (Pt x2 y2) = sqrt $ (x1-x2)^2 + (y1-y2)^2

data Fraction = Integer :/: Integer deriving (Eq, Show)
half = 1 :/: 2

mul :: Fraction -> Fraction -> Fraction
mul (n1 :/: d1) (n2 :/: d2) = (n1 * n2) :/: (d1 * d2)

--Records
data Person = Person String String Int Float deriving (Show)

data Person2 = Person2 { firstName::String, lastName::String, age::Int, height::Float } deriving (Show) --cleaner

messi = Person2 { firstName="Leo", lastName="Messi", age=35, height=1.68 }

--Types inside other types
data Shape = Circle Point Double | Rectangle Point Point

--Types with generics
data Pair a b = Pair a b deriving (Show, Eq)

--Recursive Types
data Tree a = Nil | Node a (Tree a) (Tree a)

sumTree :: (Num a) => Tree a -> a
sumTree Nil = 0
sumTree (Node x left right) = x + sumTree left + sumTree right

--TYPE CLASSES: Its like an interface
--Show
class Show a where
    show :: a -> String
--Eq
class Eq a where
    (==) :: a -> a -> Bool
    (/=) :: a -> a -> Bool
    x /= y = not (x == y)
--Ord
class Ord a where
    (>), (<), (<=), (>=) :: a -> a -> Bool
    max, min             :: a -> a -> a
    compare              :: a -> a -> Ordering
--Num
class  Num a  where
    (+), (-), (*)       :: a -> a -> a
    negate              :: a -> a         -- negate x == (-x)
    abs                 :: a -> a
    signum              :: a -> a
    fromInteger         :: Integer -> a

--Implementation

data Match = String :-: String

instance Show Match where
    show (t1 :-: t2) = show t1 ++ " vs " ++ show t2

instance Eq Match where
    (==) (a1 :-: a2) (b1 :-: b2) = a1 == b1 && a2 == b2

--ERROR HANDLING
--Error fatal
maximumE :: (Ord a) => [a] -> a
maximumE [] = error "Trying to get maximum of an empty list"
maximumE l  = foldr1 max l

--Maybe
maximumM :: (Ord a) => [a] ->Maybe  a
maximumM [] = Nothing
maximumM l  = Just $ foldr1 max l

--Either
maximumE :: (Ord a) => [a] -> Either String a
maximumE [] = Left "Trying to get maximum of an empty list"
maximumE l  = Right $ foldr1 max l