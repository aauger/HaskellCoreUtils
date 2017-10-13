module Utils (zipK) where

zipK :: [a] -> [a] -> a -> [(a, a)]
zipK (x:xs) (y:ys) k = (x, y) : zipK xs ys k
zipK (x:xs) _      k = (x, k) : zipK xs [] k
zipK _      (y:ys) k = (k, y) : zipK [] ys k
zipK _      _      k = []