module Order where
 
data DayOfWeek = 
  Mon | Tue | Weds | Thu | Fri | Sat | Sun
  deriving (Ord, Show)
  
-- The Eq instance needs to be defined in order to derive Ord --
instance Eq DayOfWeek where 
  (==) Mon Mon = True 
  (==) Tue Tue = True 
  (==) Weds Weds = True
  (==) Thu Thu = True
  (==) Fri Fri = True
  (==) Sat Sat = True
  (==) Sun Sun = True
  (==)_ _ = False
