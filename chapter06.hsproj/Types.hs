module Types where
  
-- Just a silly example
class Numberish a where 
  fromNumber :: Integer -> a 
  toNumber :: a -> Integer
  
newtype Age = Age Integer deriving (Eq, Show)

instance Numberish Age where 
  fromNumber n = Age n 
  toNumber (Age n) = n

newtype Year = Year Integer deriving (Eq, Show)

instance Numberish Year where 
  fromNumber n = Year n 
  toNumber (Year n) = n  

sumNumberish :: Numberish a => a -> a -> a 
sumNumberish a a' = fromNumber summed 
  where integerOfA = toNumber a
        integerOfAPrime = toNumber a'
        summed = integerOfA + integerOfAPrime


-- Why not write a typeclass like this? For reasons we’ll explain when we talk about Monoid, it’s important that your typeclasses have laws and rules about how they work. Numberish is a bit... arbitrary. There are better ways to express what it does in Haskell than a typeclass. Functions and values alone suffice here. --
