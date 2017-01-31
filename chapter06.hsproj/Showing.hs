module Showing where

data DayOfWeek =  Mon | Tue | Weds | Thu | Fri | Sat | Sun
  

instance Show DayOfWeek where
  show Mon = "Monday"
  show Tue = "Tuesday"
  show Weds = "Wednesday"
  show Thu = "Thursday"
  show Fri = "Friday"
  show Sat = "Saturday"
  show Sun = "Sunday"
