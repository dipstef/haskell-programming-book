module ApplyingMonad where
  
import Network.Socket

openSocket :: FilePath -> IO Socket
openSocket p = do
  sock <- socket AF_UNIX Stream defaultProtocol
  connect sock sockAddr
  return sock
  --  where sockAddr = SockAddrUnix . encodeString $ p
  where sockAddr = SockAddrUnix p
  
main :: IO ()
main = do
  initAndFp <- runEitherT $ do
    fp <- tryHead NoConfig =<< lift getArgs
    initCfg <- load' fp
    return (initCfg, fp)
    either bail (uncurry boot) initAndFp
  
  where
    boot initCfg fp =
      void $ runMVC mempty
             oracleModel (core initCfg fp)
      bail NoConfig = 
        errorExit "Please pass a config"
      bail (InvalidConfig e) = 
        errorExit ("Invalid config " ++ show e)
      load' fp = 
        hoistEither 
        . fmapL InvalidConfig =<< lift (load fp)