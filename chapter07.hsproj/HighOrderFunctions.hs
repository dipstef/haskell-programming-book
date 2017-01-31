module HighOrderFunctions where
  
-- When we want to express a function argument within a functiontype, we must use parentheses to nest it. --
flipFun :: (a->b->c) -> b -> a-> c 
flipFun f x y = f y x

myFlip :: (a->b->c) -> b -> a-> c 
myFlip f = \ x y -> f y x

returnLast :: a -> b -> c -> d -> d
returnLast _ _ _ d = d

returnLast' :: a -> (b -> (c -> (d -> d)))
returnLast' _ _ _ d = d

returnAfterApply :: (a->b) -> a -> c -> b
returnAfterApply f a c = f a



data Employee = 
   Coder 
  |Manager
  |Veep
  |CEO
  deriving (Eq, Ord, Show)
  
reportBoss :: Employee -> Employee -> IO ()
reportBoss e e' = putStrLn $ show e ++ " is the boss of " ++ show e'

  
employeeRank :: Employee -> Employee -> IO ()
employeeRank e e' = 
  case compare e e' of 
    GT -> reportBoss e e'
    EQ -> putStrLn "Neither Employee is the boss"
    LT -> reportBoss e' e
  

employeeRank' :: (Employee -> Employee -> Ordering) 
  -> Employee 
  -> Employee 
  -> IO ()
  
employeeRank' f e e' = 
  case f e e' of 
    GT -> reportBoss e e'
    EQ -> putStrLn "Neither Employee is the boss"
    LT -> reportBoss e' e
  

codersRuleCEOsDrool :: Employee -> Employee -> Ordering
codersRuleCEOsDrool Coder Coder = EQ
codersRuleCEOsDrool Coder _ = GT
codersRuleCEOsDrool _ Coder = LT
codersRuleCEOsDrool e e' = compare e e'
