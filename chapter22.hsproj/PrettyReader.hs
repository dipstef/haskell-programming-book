{-# LANGUAGE NoImplicitPrelude #-}
module PrettyReader where
  
flip :: (a -> b -> c) -> (b -> a -> c)
flip f a b = f b a

const :: a -> b -> a
const a b = a

(.) :: (b -> c) -> (a -> b) -> (a -> c)
f . g = \a -> f (g a)

withReaderT
  :: (r' -> r)
  -- ^ The function to modify the environment.
  -> ReaderT r m a
  -- ^ Computation to run in the modified environment.
  -> ReaderT r' m a
  
withReaderT f m = ReaderT $ runReaderT m . f