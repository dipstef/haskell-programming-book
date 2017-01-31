module Folding where
  
foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' f z xs = 
  case xs of 
    [] -> z
    (x:xs) -> f x (foldr' f z xs)
    
foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl' f acc [] = acc
foldl' f acc (x:xs) = foldl' f (f acc x) xs

scanl' :: (a -> b -> a) -> a -> [b] -> [a]
scanl' f q ls = 
  q : 
  (case ls of 
    [] -> [] 
    x:xs -> scanl' f (f q x) xs)
 

fibs = 1 : scanl (+) 1 fibs

fibsN x = fibs !! x
