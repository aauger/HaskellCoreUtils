import System.Directory
import Control.Monad
import Data.List

main = do
	curDir <- getCurrentDirectory
	dirConts <- liftM sort $ getDirectoryContents curDir
	mapM_ putStrLn dirConts
