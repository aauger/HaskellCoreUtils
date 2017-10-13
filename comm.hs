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
comp _ _ = []

main = do
	args <- getArgs
	fFileCont <- readFile (args !! 0)
	sFileCont <- readFile (args !! 1)
	let fFileLines = lines fFileCont
	let sFileLines = lines sFileCont
	let results = comp fFileLines sFileLines
	forM_ results putStrLn