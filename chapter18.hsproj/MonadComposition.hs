module MonadComposition where
  
import Control.Monad ((>=>))

sayHi :: String -> IO String
sayHi greeting = do
  putStrLn greeting
  getLine
  
readM :: Read a => String -> IO a
readM = return . read

getAge :: String -> IO Int
getAge = sayHi >=> readM

askForAge :: IO Int
askForAge = getAge "Hello! How old are you? "

-- We used return composed with read to turn it into something that provides monadic structure after being bound over the output of sayHi. We needed the kleisli composition operator to stitch sayHi and readM together