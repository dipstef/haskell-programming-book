data Trivial = Trivial'

data UnaryTypeCon a = UnaryValueCon a

data PugType = PugData
data HuskyType a = HuskyData
data DogueDeBordeaux doge = DogueDeBordeaux doge

data Doggies a = Husky a | Mastiff a deriving (Eq,Show)

data Price =  Price Integer deriving (Eq, Show)

data Manufacturer = Mini | Mazda| Tata deriving (Eq, Show)

data Airline = PapuAir | CatapultsR'Us |TakeYourChancesUnited deriving (Eq, Show)

data Vehicle = Car Manufacturer Price--        (k)  (l) [2] [3]| Plane Airline-- (m) [4]deriving (Eq, Show)-- type constructor (k)
-- two data constructors (l) and (m).-- three type arguments [2], [3], and [4]-- two type arguments to (l) are [2] and [3]-- type argument to (m) is [4]

-- nullary
data Example0 = Example0 deriving (Eq, Show)-- unary 
data Example1 = Example1 Int deriving (Eq, Show)-- product of Int and Stringdata Example2 = Example2 Int String deriving (Eq, Show)
data Example = MakeExample deriving Show

newtype Goats = Goats Int deriving (Eq, Show)

class TooMany a 
  where tooMany :: a -> Bool
 
instance TooMany Int 
  where tooMany n = n > 42
  
instance TooMany Goats where  tooMany (Goats n) = n > 43

data Person = MkPerson String Int deriving (Eq, Show)

namae :: Person -> String
namae (MkPerson s _) = s

data Person' = Person' { name :: String, age :: Int }deriving (Eq, Show)
