module Json (
  jsonFile
) where

import Text.ParserCombinators.Parsec
import Numeric

-- jsonFile :: CharParser () [(String, Maybe String)]
-- jsonFile = p_pair `sepBy` char '&'

-- p_pair :: CharParser () (String, Maybe String)
-- p_pair = do
--   name <- many1 p_char
--   value <- optionMaybe (char '=' >> many p_char)
--   return (name, value)

-- p_char :: CharParser () Char
-- p_char = oneOf urlBaseChars
--      <|> (char '+' >> return ' ')
--      <|> p_hex

-- urlBaseChars = ['a'..'z']++['A'..'Z']++['0'..'9']++"$-_.!*'(),"


-- p_hex :: CharParser () Char
-- p_hex = do
--   char '%'
--   a <- hexDigit
--   b <- hexDigit
--   let ((d, _):_) = readHex [a,b]
--   return . toEnum $ d

data JValue = JString String
            | JNumber Double
            | JBool Bool
            | JNull
            | JObject [(String, JValue)]
            | JArray [JValue]
              deriving (Eq, Ord, Show)


jsonFile:: CharParser () [(String, Maybe String)]
