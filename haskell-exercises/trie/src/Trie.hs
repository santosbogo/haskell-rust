module Trie  (Trie(..), left, right, find, decode, toList) where

import Bit

data Trie a = Leaf a | Trie a :-: Trie a deriving (Eq, Show)

left :: Trie a -> Trie a
left ( l :-: _ ) = l
left _ = error "No left element"

right :: Trie a -> Trie a
right ( _ :-: r ) = r
right _ = error "No right element"

find :: Bits -> Trie a -> a
find [] (Leaf a) = a
find [] _ = error "No leaf"
find (b : bs) t
    | b == F = find bs (left t)
    | otherwise = find bs (right t)

decode :: Bits -> Trie Char -> String
decode bits trie = fromString bits trie trie ""

fromString :: Bits -> Trie Char -> Trie Char -> String -> String
fromString [] (Leaf c) _ acc = acc ++ [c]
fromString [] _ _ _ = error "Not leaf"
fromString (b:bs) (Leaf c) root acc = fromString (b:bs) root root (acc ++ [c])
fromString (b:bs) t root acc
    | b == T = fromString bs (right t) root acc
    | otherwise = fromString bs (left t) root acc

toList :: Trie a -> [(a, Bits)]
toList trie = inOrder trie []

inOrder :: Trie a -> Bits -> [(a, Bits)]
inOrder (Leaf a) bits = [(a, bits)]
inOrder (l :-: r) bits = inOrder l (bits ++ [F]) ++ inOrder r (bits ++ [T])
