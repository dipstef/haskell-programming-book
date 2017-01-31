module ApplyingFunctor where
  
import Data.Time.Clock

import Data.Text (Text)


offsetCurrentTime :: NominalDiffTime -> IO UTCTime
offsetCurrentTime offset =
  fmap (addUTCTime (offset * 24 * 3600)) $ getCurrentTime
  
--import qualified Data.Text as T
--import qualified Data.UUID as UUID
--import qualified Data.UUID.V4 as UUIDv4
--
--textUuid :: IO Text--textUuid = fmap (T.pack . UUID.toString) UUIDv4.nextRandom

--type AppHandler = Handler App App

--userAgent :: AppHandler (Maybe UserAgent)
--userAgent = (fmap . fmap) userAgent' getRequest

--userAgent' :: Request -> Maybe UserAgent
--userAgent' req = getHeader "User-Agent" req