module Main where

import System.Environment
import Control.Monad

fShow :: [String] -> Int -> IO ()
fShow [] _ = return ()
fShow xs n = do
	forM_ (take n xs) putStrLn
	getChar
	fShow (drop n xs) n

main = do
	args <- getArgs
	case args of
		[n, fn] -> do
			contents <- readFile fn
			let fFileLines = lines contents
			let nv = read n :: Int
			fShow fFileLines nv
		[fn] -> do
			contents <- readFile fn
			let fFileLines = lines contents
			fShow fFileLines 20
		_    -> do
			putStrLn "Usage: more [optional: linecount] [filename]"

