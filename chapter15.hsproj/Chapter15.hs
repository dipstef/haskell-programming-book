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
  -- left identity  mappend' mempty' x = x  -- right identity  mappend' x mempty' = x  -- associativity  mappend' x (mappend' y z) =   mappend' (mappend' x y) z  mconcat = foldr mappend' mempty'


instance Monoid'' b => Monoid'' (a -> b)
instance (Monoid'' a, Monoid'' b) => Monoid'' (a, b)
instance (Monoid'' a, Monoid'' b, Monoid'' c) => Monoid'' (a, b, c)
