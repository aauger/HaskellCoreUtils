import System.Environment
import Data.Maybe
import Data.List

squash :: String -> [String] -> [String]
squash cs xs = map (f cs) xs
	where
		f ch s@(y:ys)
			| elem y ch = [y]
			| otherwise = s

main = do
	args <- getArgs
	case args of 
		[a] -> do
			contents <- getContents
			let proc = concat $ squash a (group contents)
			putStrLn proc
		_      ->
			putStrLn "Usage: squash [set]"