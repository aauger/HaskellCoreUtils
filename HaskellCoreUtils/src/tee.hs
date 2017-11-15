module Main where

import System.Environment
import System.IO
import Control.Monad

main = do
	args <- getArgs
	case args of
		[] -> do
			putStrLn "usage: tee filename [optional: additional filenames]"
		xs -> do
			pString <- getContents
			forM_ xs $ (flip writeFile) pString
			putStr pString