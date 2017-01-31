module ReaderAppicative where
  
import Control.Applicative (liftA2)

newtype HumanName = 
  HumanName String 
  deriving (Eq, Show)
  
newtype DogName =
  DogName String
  deriving (Eq, Show)
  
newtype Address =
  Address String
  deriving (Eq, Show)
  
data Person =
  Person {
    humanName :: HumanName
  , dogName :: DogName
  , address :: Address
  } deriving (Eq, Show)
  
data Dog =
  Dog {
    dogsName :: DogName
  , dogsAddress :: Address

pers :: Person
pers = 
  Person (HumanName "Big Bird")
         (DogName "Barkley")
         (Address "Sesame Street")
         
chris :: Person
chris = 
  Person (HumanName "Chris Allen")
         
-- without Reader
getDog :: Person -> Dog
getDog p = Dog (dogName p) (address p)

getDogR :: Person -> Dog
getDogR = Dog <$> dogName <*> address

-- with Reader, alternate