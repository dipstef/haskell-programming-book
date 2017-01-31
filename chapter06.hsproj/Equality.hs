module Equality where

-- Data constructors and type constructors o en have the same name in Haskell, and that can get confusing. We used the single quote at the end of the data constructor --
data Trivial = Trivial'

instance Eq Trivial where
  Trivial' == Trivial' = True 
 

data DayOfWeek =  Mon | Tue | Weds | Thu | Fri | Sat | Sun
  
instance Eq DayOfWeek where 
  (==) Mon Mon = True 
  (==) Tue Tue = True 
  (==) Weds Weds = True
  (==) Thu Thu = True
  (==) Fri Fri = True
  (==) Sat Sat = True
  (==) Sun Sun = True
  (==)_ _ = False
  
data Date = Date DayOfWeek Int

instance Eq Date where  (==) (Date weekday dayOfMonth)       (Date weekday' dayOfMonth') =    weekday == weekday' && dayOfMonth == dayOfMonth'

data Identity a = Identity a


-- we’ll sometimes need to require our argument or arguments to provide some typeclass instances for us in order to write an instance for the datatype containing them --

instance Eq a => Eq (Identity a) where
  (==) (Identity v) (Identity v') = v == v'