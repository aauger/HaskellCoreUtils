import System.Directory
import Control.Monad
import Data.List

(</>) :: String -> String -> String
(</>) lhs rhs = lhs ++ "\\" ++ rhs

duplicate :: String -> Int -> String
duplicate st ct = concat $ replicate ct st

pDir :: String -> Int -> IO ()
pDir dir ind = do
	dirConts <- listDirectory dir
	forM_ dirConts f
	where
		f fn = do
			putStrLn $ (duplicate "    " ind) ++ "├── " ++ fn
			isDir <- doesDirectoryExist $ dir </> fn
			when (isDir) $ (flip pDir) (ind + 1) $ dir </> fn

main = do
	cDir <- getCurrentDirectory
	pDir cDir 0