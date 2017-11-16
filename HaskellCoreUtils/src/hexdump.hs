module Main where

import System.Environment
import Control.Monad
import Numeric (showHex)
import Data.Char

printDump :: String -> IO ()
printDump [] = return ()
printDump s = do
	putStrLn $ concat $ map (\a -> (lpad (showHex (ord a) "") '0' 2) ++ " ") $ take 16 s
	printDump $ drop 16 s
	where
		lpad :: String -> Char -> Int -> String
		lpad str c i = (replicate (i - (length str)) c) ++ str

main = do
	args <- getArgs
	case args of
		[fn] -> do
			contents <- readFile fn
			printDump contents
		_    -> do
			putStrLn "Usage: hexdump [filename]"