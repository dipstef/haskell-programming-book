module Semigroup where
  
-- :| is an infix data constructor that takes two (type) arguments. It’s a product of a and [a]. It guarantees that we always have at least one value of type a, which [a] does not guarantee as any list might be empty
data NonEmpty a = a :|- [a]deriving (Eq, Ord, Show)

-- it is just a name for an infix data constructor. Data constructors with only non-alphanumeric symbols and that begin with a colon are infix by default; those with alphanumeric names are prefix by default.

newtype NonEmpty' a =NonEmpty' (a, [a])deriving (Eq, Ord, Show)