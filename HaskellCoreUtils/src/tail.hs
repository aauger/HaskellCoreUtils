module Main where

import System.Environment
import Control.Monad

main = do
	args <- getArgs
	case args of
		[n, fn] -> do
			contents <- readFile fn
			let fFileLines = lines contents
			let nv = read n :: Int
			let dCount = (length fFileLines) - nv
			mapM_ putStrLn $ drop dCount fFileLines
		[fn] -> do
			contents <- readFile fn
			let fFileLines = lines contents
			mapM_ putStrLn $ drop ((length fFileLines) - 20) fFileLines
		_    -> do
			putStrLn "Usage: tail [optional: linecount] [filename]"