module FizzBuzz where
  
import Control.Monad
import Control.Monad.Trans.State
-- http://hackage.haskell.org/package/dlist
import qualified Data.DList as DL

  
fizzBuzz :: Integer -> String
fizzBuzz n | n `mod` 15 == 0 = "FizzBuzz"
  | n `mod` 5 == 0 = "Buzz"
  | n `mod` 3 == 0 = "Fizz"
  | otherwise = show n
  
--fizzbuzzList :: [Integer] -> [String]
--fizzbuzzList list =
--  execState (mapM_ addResult list) []
--  
--addResult :: Integer -> State [String]
--addResult n = do
--  xs <- get
--  let result = fizzBuzz n
--  put (result : xs)

--fizzbuzzList :: [Integer] -> [String]
--fizzbuzzList list =
--  let dlist = execState (mapM_ addResult list) DL.empty
--  in DL.apply dlist [] -- convert back to normal list
--  
addResult :: Integer -> State (DL.DList String)
addResult n = do
  xs <- get
  let result = fizzBuzz n
  -- snoc appends to the end, unlike
  -- cons which adds to the front
  put (DL.snoc xs result)

fizzbuzzList :: [Integer] -> DL.DList String
fizzbuzzList list =
  execState (mapM_ addResult list) DL.empty
  