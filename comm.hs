import System.Environment
import System.IO

-- zipK is merely zip, but retains elements of the longer list
-- with a filler inserted
zipK :: [a] -> [a] -> a -> [(a, a)]
zipK (x:xs) (y:ys) k = (x, y) : zipK xs ys k
zipK (x:xs) _      k = (x, k) : zipK xs [] k
zipK _      (y:ys) k = (k, y) : zipK [] ys k
zipK _      _      k = []

spResult :: (String, String) -> String
spResult (a, "") = a
spResult ("", b) = "\t" ++ b
spResult (a, b)
	| a == b     = replicate 2 '\t' ++ a
	| otherwise  = a ++ "\n\t" ++ b

main = do
	args <- getArgs
	fFileCont <- readFile (args !! 0)
	sFileCont <- readFile (args !! 1)
	let fFileLines = lines fFileCont
	let sFileLines = lines sFileCont
	let lZip = zipK fFileLines sFileLines ""
	let results = map spResult lZip
	mapM_ putStrLn results