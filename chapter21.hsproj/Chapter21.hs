module Chapter21 where
  
import Data.Maybe

-- stringToMorse :: String -> Maybe [Morse]
-- stringToMorse = traverse charToMorse

data Query = Query
data SomeObj = SomeObj
data IoOnlyObj = IoOnlyObj
data Err = Err

-- There's a decoder function that makes
decodeFn :: String -> Either Err SomeObj
decodeFn = undefined


-- There's a query, that runs against DB and
fetchFn :: Query -> IO [String]
fetchFn = undefined

-- there's some additional "context initializer",
makeIoOnlyObj :: [SomeObj] -> IO [(SomeObj, IoOnlyObj)]
makeIoOnlyObj = undefined


-- before
pipelineFn' :: Query -> IO (Either Err [(SomeObj, IoOnlyObj)])
pipelineFn' query = do
  a <- fetchFn query
  case sequence (map decodeFn a) of
    (Left err) -> return $ Left $ err
    (Right res) -> do
      a <- makeIoOnlyObj res
      return $ Right a
      
pipelineFn'' :: Query -> IO (Either Err [(SomeObj, IoOnlyObj)])
pipelineFn'' query = do
  a <- fetchFn query
  traverse makeIoOnlyObj (mapM decodeFn a)
  
pipelineFn :: Query-> IO (Either Err [(SomeObj, IoOnlyObj)])
pipelineFn =
--  (traverse makeIoOnlyObj . mapM decodeFn =<<) . fetchFn
  (traverse makeIoOnlyObj . traverse decodeFn =<<) . fetchFn