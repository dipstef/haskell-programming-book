module Chapter18 where
  
import Control.Applicative (liftA2)
import Control.Monad (join, liftM2, liftM3)

sequencing :: IO ()
sequencing = do
  putStrLn "blah"
  putStrLn "another thing"
  
sequencing' :: IO ()
sequencing' = putStrLn "blah" >> putStrLn "another thing"

sequencing'' :: IO ()
sequencing'' = putStrLn "blah" *> putStrLn "another thing"

binding :: IO ()
binding = do
  name <- getLine
  putStrLn name
  
binding' :: IO ()
binding' = getLine >>= putStrLn

bindingAndSequencing :: IO ()
bindingAndSequencing = do
  putStrLn "name pls:"
  name <- getLine
  putStrLn ("y helo thar: " ++ name)
  
bindingAndSequencing' :: IO ()
bindingAndSequencing' = 
  putStrLn "name pls:" >>
  \name -> putStrLn ("y helo thar: " ++ name)
  
twoBinds :: IO ()
twoBinds = do
  putStrLn "name pls:"
  name <- getLine
  putStrLn "age pls:"
  age <- getLine
  putStrLn ("y helo thar: "
            ++ name ++ " who is: "
            
twoBinds' :: IO ()
twoBinds' = 
  putStrLn "name pls:" >>