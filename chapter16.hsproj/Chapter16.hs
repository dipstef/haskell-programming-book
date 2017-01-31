module Chapter16 where
  
data FixMePls a = FixMe| Pls a deriving (Eq, Show)

instance Functor FixMePls where
  fmap _ FixMe = FixMe
  fmap f (Pls a) = Pls (f a)


data WhoCares a =
  ItDoesnt

instance Functor WhoCares where
  fmap _ ItDoesnt = ItDoesnt
  fmap _ WhatThisIsCalled = WhatThisIsCalled
  fmap f (Matter a) = Matter (f a)
  

data CountingBad a = Heisenberg Int a

-- super NOT okay
-- breaks composition
instance Functor CountingBad where
  
replaceWithP = const 'p'

replaceWithP' :: [Maybe [Char]] -> Char
replaceWithP' = replaceWithP

data Two a b = Two a b deriving (Eq, Show)

data Or a b = First a | Second b deriving (Eq, Show)

-- remember, names don't mean anything beyond

instance Functor (Two a) where
  
newtype Constant a b = Constant { getConstant :: a } deriving (Eq, Show)

instance Functor (Constant m) where
  
data Wrap f a = Wrap (f a) deriving (Eq, Show)
  
instance Functor f => Functor (Wrap f) where
  
getInt :: IO Int
getInt = fmap read getLine

meTooIsm :: IO String
meTooIsm = do
  input <- getLine
  return (input ++ "and me too!")
  
bumpIt :: IO Int
bumpIt = do
  intVal <- getInt
  return (intVal + 1)