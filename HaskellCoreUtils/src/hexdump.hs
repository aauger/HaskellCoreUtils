module Main where

import System.Environment
import Control.Monad
import Numeric (showHex)
import Data.Char
import Data.Word
import qualified Data.ByteString.Lazy as C

printDump :: [Word8] -> IO ()
printDump s
	| s == [] = return ()
	| otherwise = do
		mapM_ putStr $ map format (take 16 s)
		putStrLn ""
		printDump $ drop 16 s
		where
			hpad :: String -> Char -> Int -> String
			hpad str c i = (replicate (i - (length str)) c) ++ str ++ " "
			format :: Word8 -> String
			format i = hpad (showHex i "") ' ' 2

main = do
	args <- getArgs
	case args of
		[fn] -> do
			contents <- C.readFile fn
			printDump (C.unpack contents)
		_    -> do
			putStrLn "Usage: hexdump [filename]"