import System.Environment
import Data.Maybe

main = do
	args <- getArgs
	case args of 
		[a, b] -> do
			contents <- getContents
			let table = zip a b
			let outp = map (\c -> fromMaybe c $ lookup c table) contents
			putStrLn outp
		_      ->
			putStrLn "Usage: tr [original Set] [second Set]"