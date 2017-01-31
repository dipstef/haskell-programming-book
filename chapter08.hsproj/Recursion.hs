module Recursion where
  
factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

inc :: Num a => a -> a
inc = (+1)

incTimes :: (Eq a, Num a) => a -> a -> a
incTimes 0 n = n
incTimes times n = 1 + (incTimes (times - 1) n)


applyTimes :: (Eq a, Num a) => a -> (b -> b) -> b -> b
applyTimes 0 f b = b
applyTimes n f b = f (applyTimes (n-1) f b)

-- we can make the composition more obvious in --
applyTimes' :: (Eq a, Num a) => a -> (b -> b) -> b -> b
applyTimes' 0 f b = b
applyTimes' n f b = f . applyTimes' (n-1) f $ b


fibonacci :: Integral a => a -> a
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci x = fibonacci (x - 1) + fibonacci (x - 2)


dividedBy :: Integral a => a -> a -> (a, a)
dividedBy num denom = go num denom 0 where 
  go n d count 
    | (n < d) = (count, n)
    | otherwise = go (n - d) d (count + 1)
  
   