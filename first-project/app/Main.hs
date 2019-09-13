module Main where
import Text.ParserCombinators.Parsec
import Lib
import Csv
import Json

main :: IO ()
main =
  do c <- getContents
     case  parse jsonFile "(stdin)" c of
        Left e -> do putStrLn "Error parsing input:"
                     print e
        Right r -> mapM_ print r
