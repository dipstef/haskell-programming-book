module PatternMatching where
  
newtype Username = Username String
newtype AccountNumber = AccountNumber Integer
  
data User = UnregisteredUser | RegisteredUser Username AccountNumber

printUser :: User -> IO ()

printUser UnregisteredUser = putStrLn "UnregisteredUser"

printUser (RegisteredUser (Username name) (AccountNumber acctNum)) = 
  putStrLn $ name ++ " " ++ show acctNum


data WherePenguinsLive = 
  Galapagos| Antarctica| Australia| SouthAfrica| SouthAmericaderiving (Eq, Show)

data Penguin = Peng WherePenguinsLive  deriving (Eq, Show)


isSouthAfrica :: WherePenguinsLive -> Bool
isSouthAfrica SouthAfrica = True
isSouthAfrica Galapagos = False
isSouthAfrica Antarctica = False
isSouthAfrica Australia = False
isSouthAfrica SouthAmerica = False

isSouthAfrica' :: WherePenguinsLive -> Bool
isSouthAfrica' SouthAfrica = True
_ = False


giveMeWhereTheyLive :: Penguin -> WherePenguinsLive
giveMeWhereTheyLive (Peng whereTheyLive) = whereTheyLive


galapagosPenguin :: Penguin -> Bool
galapagosPenguin (Peng Galapagos) = True
galapagosPenguin _ = False 

antarticPenguin :: Penguin -> Bool
antarticPenguin (Peng Antarctica) = True
antarticPenguin _ = False

antarcticOrGalapagos :: Penguin -> Bool 
antarcticOrGalapagos p = (antarticPenguin p) || (galapagosPenguin p)

tupleShuffle :: (a, b) -> (c, d) -> ((b, d), (a, c))
tupleShuffle (a, b) (c, d) = ((b, d), (a, c))

addEmUp :: Num a => (a, a) -> a
addEmUp (x, y) = x + y


addEmUpAlt :: Num a => (a, a) -> a
addEmUpAlt tup = (fst tup) + (snd tup)

fst3 :: (a,b,c) -> a
fst3 (a,b,c) = a 

third3 :: (a,b,c) -> c
third3 (a,b,c) = c

