{-# LANGUAGE OverloadedStrings #-}
module  JinjaParser (jinjaParser) where

import Data.Either.Combinators (rightToMaybe, whenLeft)
import System.IO (print)
import System.IO.Error (tryIOError)
import Text.Ginger (IncludeResolver, ParserError, SourceName, SourcePos, Template)
import Text.Ginger.Parse (parseGingerFile)

jinjaParser :: SourceName -> IO (Either ParserError (Template SourcePos))
jinjaParser = parseGingerFile loadFile

loadFile :: IncludeResolver IO
loadFile fileName = do
  contents <- tryIOError (readFile fileName)
  whenLeft contents print
  return $ rightToMaybe contents