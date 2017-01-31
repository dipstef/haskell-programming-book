module EitherMonad where
  
-- years ago
type Founded = Int

-- number of programmers
type Coders = Int

data SoftwareShop = 
  Shop {
    founded :: Founded
  , programmers :: Coders
  } deriving (Eq, Show)
  
data FoundedError =
    NegativeYears Founded
  
validateFounded :: Int -> Either FoundedError Founded
validateFounded n
  | n < 0 = Left $ NegativeYears n

-- Tho, many programmers *are* negative.
validateCoders :: Int -> Either FoundedError Coders
validateCoders n
  | n < 0 = Left $ NegativeCoders n
  | n > 5000 = Left $ TooManyCoders n
  | otherwise = Right n
  
mkSoftware :: Int -> Int -> Either FoundedError SoftwareShop
mkSoftware years coders = do
  founded <- validateFounded years
  programmers <- validateCoders coders
  if programmers > div founded 10
  then Left $ TooManyCodersForYears founded programmers
  else Right $ Shop founded programmers