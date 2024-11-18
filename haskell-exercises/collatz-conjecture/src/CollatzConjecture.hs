module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz a
    | a <= 0 = Nothing
    | otherwise = Just $ toInteger $ (length $ collatzListBuilder a) - 1

collatzListBuilder:: Integer -> [Integer]
collatzListBuilder a
    | a == 1 = [1]
    | a `mod` 2 == 0 = a : collatzListBuilder(a `div` 2)
    | otherwise = a : collatzListBuilder(3 * a + 1)

--collatz :: Integer -> Maybe Integer
--collatz a
--    | a <= 0 = Nothing
--    | a == 1 = Just 0
--    | a `mod` 2 == 0 = fmap(+1) $ collatz(a `div` 2)
--    | otherwise = fmap(+1) $ collatz(3 * a + 1)