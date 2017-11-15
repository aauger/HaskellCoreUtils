module Main where

import System.Environment
import Data.Maybe
import Data.List
import Control.Monad
import Data.Char

split :: Eq a => a -> [a] -> [[a]]
split _ [] = []
split s w = takeWhile (/= s) w : (split s $ drop 1 $ dropWhile (/= s) w)

processFragment :: String -> String
processFragment inp = reverse $ takeWhile (\a -> not (isControl a)) $ reverse inp

main = do
	args <- getArgs
	case args of 
		[a, b] -> do
			contents <- readFile b
			let minLength = read a :: Int
			let strings = filter (\a -> length a >= minLength) 
				$ map processFragment 
				$ split '\0' contents
			forM_ strings putStrLn
		_      ->
			putStrLn "Usage: strings [min-length: 4?] [binary]"