import System.Environment
import System.IO
import Data.List
import Control.Monad

comp :: [String] -> [String] -> [String]
comp ax@(x:xs) ay@(y:ys) = case compare x y of
	LT -> x : comp xs ay
	EQ -> ("\t\t" ++ x) : comp xs ys
	GT -> ("\t" ++ y) : comp ax ys
comp xs [] = xs
comp [] ys = ["\t" ++ y | y <- ys]

main = do
	args <- getArgs
	case args of
		[fn1, fn2] -> do
			fFileCont <- readFile fn1
			sFileCont <- readFile fn2
			let fFileLines = lines fFileCont
			let sFileLines = lines sFileCont
			let results = comp fFileLines sFileLines
			forM_ results putStrLn
		_ -> do
			putStrLn "Usage: comm [file1] [file2]"