import Data.List.Split ( splitOn )
import Data.Graph ( graphFromEdges, transposeG, reachable, Graph )
import Data.Maybe ( fromMaybe, isJust )

type Instruction = (String, String, [String]) 

readContent :: IO [String]
readContent = splitOn "\n" <$> readFile "input.txt"

parseLine :: String -> Instruction
parseLine ln = output
  where
    splitLine = init $ splitOn " bag" ln
    bagColors = fmap (concat . reverse . take 2 . reverse . splitOn " ") splitLine
    output = (head bagColors, head bagColors, tail bagColors)

parseInstructions :: [String] -> [Instruction]
parseInstructions = map parseLine

canReachShinyGold :: [Instruction] -> Maybe Int
canReachShinyGold instructionSet = output
  where 
    (graph, nodeFromVertex, vertexFromKey) = graphFromEdges instructionSet
    shinyGoldVertex = vertexFromKey "shinygold"
    output = fmap (\x -> x-1) $ length . reachable (transposeG graph) <$> shinyGoldVertex

main :: IO()
main = do
    instructions <- readContent
    print $ canReachShinyGold (parseInstructions instructions) 