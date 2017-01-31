module EqCaseGuard where 

data PersonInvalid = NameEmpty | AgeTooLow deriving (Eq, Show)

-- Compiles fine without Eq
toString :: PersonInvalid -> String
toString NameEmpty = "NameEmpty"
toString AgeTooLow = "AgeTooLow"

  
-- This does not work without an Eq instance
blah :: PersonInvalid -> String
blah pi
  | pi == NameEmpty = "NameEmpty"
  | pi == AgeTooLow = "AgeTooLow"
  | otherwise = "???"
  
type Name = String
type Age = Integer
type ValidatePerson a = Either [PersonInvalid] a

-- this type alias wasn't in our previous version
-- otherwise, these types are the same as above

data Person = Person Name Age deriving Show

ageOkay :: Age -> Either [PersonInvalid] Age
ageOkay age = case age >= 0 of
  True -> Right age
  False -> Left [AgeTooLow]
  
nameOkay :: Name -> Either [PersonInvalid] Name
nameOkay name = case name /= "" of
  True -> Right name
  False -> Left [NameEmpty]
  

mkPerson :: Name -> Age -> ValidatePerson Person
mkPerson name age = 
  mkPerson' (nameOkay name) (ageOkay age)
  
mkPerson' :: ValidatePerson Name
  -> ValidatePerson Age  -> ValidatePerson Person
  
mkPerson' (Right nameOk) (Right ageOk) =  Right (Person nameOk ageOk)
  
mkPerson' (Left badName) (Left badAge) =
  Left (badName ++ badAge)
  
mkPerson' (Left badName) _ = Left badName
mkPerson' _ (Left badAge) = Left badAge

