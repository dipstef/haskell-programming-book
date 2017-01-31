module Deconstruct where
  
newtype Name = Name String deriving Show
newtype Acres = Acres Int deriving Show

-- FarmerType is a Sum 

data FarmerType = DairyFarmer| WheatFarmer| SoybeanFarmer deriving Show

-- Farmer is a plain ole product of
-- Name, Acres, and FarmerType

data Farmer = Farmer Name Acres FarmerType deriving Show

isDairyFarmer :: Farmer -> Bool
isDairyFarmer (Farmer _ _ DairyFarmer) = True
isDairyFarmer _ = False


data FarmerRec =
  FarmerRec { name       :: Name, 
              acres      :: Acres, 
              farmerType :: FarmerType } 
  deriving Show

isDairyFarmerRec :: FarmerRec -> Bool
isDairyFarmerRec farmer = case farmerType farmer of
  DairyFarmer -> True
  _ -> False
  
-- Null nonsense --
data Automobile = 
    Null
  | Car { make :: String, model :: String, year :: Integer } deriving (Eq, Show)
  
-- Split out the record/product

data Car' = Car' { make' :: String, model' :: String , year' :: Integer }
  deriving (Eq, Show)
  
-- The Null is still not great, but  we're leaving it in to make a point

data Automobile' = Null' | Automobile Car' deriving (Eq, Show)