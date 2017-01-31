module Bottom where
  
raiseError :: Bool -> Int
raiseError True = error "blah"
raiseError False = 0

-- Another example of a bottom would be a partial function. --
partialF :: Bool -> Int
partialF False = 0

partialF' :: Bool -> Int
partialF' False = 0
partialF' _ = error $ 
  "*** Exception: " 
  ++ "Non-exhaustive " 
  ++ "patterns in function f"
  
-- How do we make our 𝑓 into a total function? One way is with the use of the datatype Maybe. --

data Maybe' a = Nothing' | Just' a deriving (Show)

maybeF :: Bool -> Maybe' Int
maybeF False = Just' 0
maybeF _ = Nothing'