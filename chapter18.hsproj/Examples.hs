module Examples where
  
twiceWhenEven :: [Integer] -> [Integer]
twiceWhenEven xs = do
  x <- xs
  if even x
  
twiceWhenEven' :: [Integer] -> [Integer]
twiceWhenEven' xs = do
  x <- xs
  if even x
  
data Cow = Cow {
  name :: String

noEmpty :: String -> Maybe String
noEmpty "" = Nothing
noEmpty str = Just str

noNegative :: Int -> Maybe Int
noNegative n | n >= 0 = Just n | otherwise = Nothing

-- if Cow's name is Bess, must be under 500
weightCheck :: Cow -> Maybe Cow
weightCheck c = 
  let w = weight c
      n = name c
  in if n == "Bess" && w > 499
     then Nothing
     else Just c
     
mkSphericalCow :: String -> Int -> Int -> Maybe Cow
mkSphericalCow name' age' weight' =
  case noEmpty name' of
      Nothing -> Nothing
      Just nammy ->
        case noNegative age' of
          Nothing -> Nothing
          Just agey ->
            case noNegative weight' of
              Nothing -> Nothing
              Just weighty -> weightCheck (Cow nammy agey weighty)
              

mkSphericalCow' :: String -> Int -> Int -> Maybe Cow
mkSphericalCow' name' age' weight' = do
  nammy <- noEmpty name'
  agey <- noNegative age'
  weighty <- noNegative weight'
  weightCheck (Cow nammy agey weighty)
  
mkSphericalCow'' :: String -> Int -> Int -> Maybe Cow
mkSphericalCow'' name' age' weight' =
  noEmpty name' >>=
  \ nammy ->
    noNegative age' >>=
    \ agey ->
      noNegative weight' >>=
      \ weighty -> weightCheck (Cow nammy agey weighty)
      
-- So why can’t we do this with Applicative? Because our weightCheck function depends on the prior existence of a Cow value and returns more monadic structure in its return type Maybe Cow.