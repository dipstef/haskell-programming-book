module NormalForm where
  
data Fiction' = Fiction' deriving Show
data Nonfiction' = Nonfiction' deriving Show

data BookType = 
  FictionBook Fiction'| NonfictionBook Nonfiction'deriving Show

type AuthorName = String

data Author' = Author' (AuthorName, BookType)

data Author = 
    Fiction AuthorName
  | Nonfiction AuthorName
  deriving (Eq, Show)
  
data Expr = 
  Number Int 
  | Add Expr Expr 
  | Minus Expr 
  | Mult Expr Expr
  | Divide Expr Expr
