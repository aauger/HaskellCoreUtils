module Main where

import System.Environment
import Control.Monad
import Numeric (showHex)
import Data.Char
import qualified Data.ByteString.Char8 as C

printDump :: C.ByteString -> IO ()
printDump s
	| s == C.empty = return ()
	| otherwise = do
		C.putStr $ C.concatMap (\a -> (C.pack (hpad (showHex (ord a) "") '0' 2))) $ C.take 16 s
		putStrLn ""
		printDump $ C.drop 16 s
		where
			hpad :: String -> Char -> Int -> String
			hpad str c i = (replicate (i - (length str)) c) ++ str ++ " "

main = do
	args <- getArgs
	case args of
		[fn] -> do
			contents <- C.readFile fn
			printDump contents
		_    -> do
			putStrLn "Usage: hexdump [filename]"