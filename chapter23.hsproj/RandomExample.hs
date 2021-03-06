module RandomExample where
  
import System.Random
import Control.Applicative (liftA3)
import Control.Monad (replicateM)
import Control.Monad.Trans.State

  
-- Six-sided die

data Die =
    DieOne
  | DieTwo
  | DieThree
  | DieFour
  | DieFive
  | DieSix
  deriving (Eq, Show)
  
intToDie :: Int -> Die
intToDie n =
  case n of
    1 -> DieOne
    2 -> DieTwo
    3 -> DieThree
    4 -> DieFour
    5 -> DieFive
    6 -> DieSix
    -- Use this tactic _extremely_ sparingly.
    -- Because partial functions are a pain, you should only use an error like this
    -- when the branch that would spawn the error can literally never happen.
    -- Unexpected software failures are often due to things like this. 
    x -> error $ "intToDie got non 1-6 integer: " ++ show x
    
-- This code isn’t optimal, but it does work. It will produce the sameresults every time

rollDieThreeTimes :: (Die, Die, Die)
rollDieThreeTimes = do
  -- this will produce the same results every
  -- time because it is free of effects.
  -- This is fine for this demonstration.
  let s = mkStdGen 0
      (d1, s1) = randomR (1, 6) s
      (d2, s2) = randomR (1, 6) s1
      (d3, _) = randomR (1, 6) s2
  (intToDie d1, intToDie d2, intToDie d3)
  
rollDie :: State StdGen Die
rollDie = state $ do
  (n, s) <- randomR (1, 6)
  return (intToDie n, s)
  
rollDie' :: State StdGen Die
rollDie' =
  intToDie <$> state (randomR (1, 6))
  
rollDieThreeTimes' :: State StdGen (Die, Die, Die)
rollDieThreeTimes' =
  liftA3 (,,) rollDie rollDie rollDie
  
-- What happened is we repeated a single die value — we didn’t repeat the state action that produces a die.
infiniteDie :: State StdGen [Die]
infiniteDie = repeat <$> rollDie

nDie :: Int -> State StdGen [Die]
nDie n = replicateM n rollDie

rollsToGetTwenty :: StdGen -> Int
rollsToGetTwenty g = go 0 0 g
  where go :: Int -> Int -> StdGen -> Int
        go sum count gen
          | sum >= 20 = count
          | otherwise =
            let (die, nextGen) = randomR (1, 6) gen
            in go (sum + die) (count + 1) nextGen