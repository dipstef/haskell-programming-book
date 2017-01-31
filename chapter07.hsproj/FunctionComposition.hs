module FunctionComposition where
  
show' :: Show a => a -> String
show' a = show a

print' :: Show a => a -> IO ()
print' a = putStr . show' $ a

