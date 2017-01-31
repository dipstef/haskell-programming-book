module Chapter15 where
  
class Monoid' m where
  mempty' :: m
  mappend' :: m -> m -> m
  mconcat' :: [m] -> m
  mconcat' = foldr mappend'  mempty'
  
instance Monoid' [a] where
  mempty' = []
  mappend' = (++)

class Monoid'' m where
  -- left identity


instance Monoid'' b => Monoid'' (a -> b)
instance (Monoid'' a, Monoid'' b) => Monoid'' (a, b)
instance (Monoid'' a, Monoid'' b, Monoid'' c) => Monoid'' (a, b, c)