module Main where

import System.Environment
import Control.Monad

displayLines :: String -> IO ()
displayLines fn = do
	content <- readFile fn
	let fLines = lines content
	forM_ fLines putStrLn

displayFiles :: [String] -> IO ()
displayFiles [] = return ()
displayFiles xs = forM_ xs displayLines

main = do
	args <- getArgs
	case args of
		[] -> putStrLn "Usage: cat file [optional: additional files]"
		xs -> displayFiles xs