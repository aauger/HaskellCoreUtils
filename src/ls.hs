import System.Directory
import Control.Monad
import Data.List

main = do
	curDir <- getCurrentDirectory
	dirConts <- getDirectoryContents curDir
	let sDirConts = sort dirConts
	mapM_ putStrLn sDirConts
