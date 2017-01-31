module Numbers where

divideThenAdd:: Fractional a => a -> a -> a  
divideThenAdd x y = (x / y) + 1


-- Num constraint on our type 𝑎 isn’t enough. Num doesn’t imply Ord --
addWeird :: (Ord a, Num a) => a -> a -> a 
addWeird x y = if x > 1 then x + y else x