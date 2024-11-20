module Parcial where

-- 2 Banquer's queue
data BQueue a = BQueue {front :: [a], back :: [a]}

empty:: BQueue a
empty = BQueue {front = [], back = []}

enqueue :: a -> BQueue a -> BQueue a
enqueue item (BQueue f b) = BQueue {front = f, back = (item:b)}

dequeue :: BQueue a -> (a, BQueue a)
dequeue (BQueue [] []) = error "Empty BQueue"
dequeue (BQueue [] b) = dequeue (BQueue {front = (reverse b), back = []})
dequeue (BQueue (f:front) b) = (f, BQueue {front = front, back = b})

-- 3 Banker's queue as general queue implementation
class Queue q where
    empty :: q a
    enqueue :: a -> q a -> q a
    dequeue :: q a -> (a, q a)

instance Queue BQueue where
    empty = BQueue { front = [], back []}

    enqueue item (BQueue f b) = BQueue {front = f, back = (item:back)}

    dequeue (BQueue [] []) = error "Empty BQueue"
    dequeue (BQueue [] back) = dequeue (BQueue {front = (reverse back), back = []})
    dequeue (BQueue (f: front) back) = (f, BQueue {front = front, back = back})

instance Show a => Show (BQueue a) where
    show (BQueue front back) = show (front ++ reverse back)












































































































