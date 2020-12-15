import Data.List.Split ( splitOn )
import Data.List.Utils ( replace )

readContent :: IO [String]
readContent = replace "\n" "" . splitOn "\n\n" <$> readFile "test.txt"

countAnsweredQuestions :: [String] -> Int
countAnsweredQuestions = sum . map (length . nub)

main :: IO()
main = do
    surveys <- readContent
    print $ countAnsweredQuestions surveys