module Lists where
  
myHead (x : _) = x

myTal (_ : xs ) = xs

safeTail :: [a] -> Maybe [a]
safeTail [] = Nothing
safeTail (x:[]) = Nothing
safeTail (_:xs) = Just xs

acro xs = [x | x <- xs, elem x ['A'..'Z']]

-- we use _ to ignore the values in our arguments or that are part of a pattern match --
length' :: [a] -> Integer
length' [] = 0
length' (_:xs) = 1 + length' xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' pred (x:xs)| pred x = x : filter pred xs| otherwise = filter pred xs