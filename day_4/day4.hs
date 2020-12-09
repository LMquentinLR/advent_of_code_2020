import Data.List.Split

readContent :: IO [String]
readContent = readFile "test.txt" >>= return . splitAll "\n\n"



main :: IO()
main = do
    ls <- readContent
    print $ ls