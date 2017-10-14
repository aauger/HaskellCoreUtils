import System.Environment
import Control.Monad

main = do
	args <- getArgs
	case args of
		[n, fn] -> do
			contents <- readFile fn
			let fFileLines = lines contents
			let nv = read n :: Int
			mapM_ putStrLn $ take nv fFileLines
		[fn] -> do
			contents <- readFile fn
			let fFileLines = lines contents
			mapM_ putStrLn $ take 20 fFileLines
		_    -> do
			putStrLn "Usage: head [optional: linecount] [filename]"

