module ApplyingApplicative where
  
--jsonSwitch :: Parser (a -> a)--jsonSwitch = 
--  infoOption $(hgRevStateTH jsonFormat)
--  $ long "json"
--  <> short 'J'
--  <> help "Display JSON version information"
--  
--parserInfo :: ParserInfo (a -> a)
--parserInfo = info (helper <*> verSwitch <* jsonSwitch) fullDesc

--parseJSON :: Value -> Parser a
--(.:) :: FromJSON a => Object -> Text -> Parser a
--
--instance FromJSON Payload where
--  parseJSON (Object v) = Payload <$> v .: "from"
--  <*> v .: "to"
--  <*> v .: "subject"
--  <*> v .: "body"
--  <*> v .: "offset_seconds"
--
--
--parseJSON v = typeMismatch "Payload" v

--parseRecord :: Record -> Parser a
--
--instance FromRecord Release where
--  parseRecord v
--  | V.length v == 5 = 
--     Release <$> v .! 0
--             <*> v .! 1
--             <*> v .! 2
--             <*> v .! 3
--             <*> v .! 4
--  | otherwise = mzero


--instance Deserializeable ShowInfoResp where
--  parser = e2err =<< convertPairs . HM.fromList <$> parsePairs
--    where
--      parsePairs :: Parser [(Text, Text)]
--      parsePairs = parsePair `sepBy` endOfLine
--      parsePair = liftA2 (,) parseKey parseValue
--      parseKey = takeTill (==':') <* kvSep
--      kvSep = string ": "
--      parseValue = takeTill isEndOfLine



--module Web.Shipping.Utils ((<||>)) where

 
--import Control.Applicative (liftA2)
--
--(<||>) :: (a -> Bool) -> (a -> Bool) -> a -> Bool
--(<||>) = liftA2 (||)
