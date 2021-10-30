module Main where

import Options.Applicative (argument, help, metavar, progDesc, str, execParser, info, fullDesc)
import Options.Applicative.Types (Parser)
import Options.Applicative.Common (runParser)

data Arguments = Arguments
  { json :: String,
    latex :: String
  }

jsonFile :: Parser String
jsonFile = argument str (metavar "JSON" <> help "Path to JSON datafile")

latexTemplate :: Parser String
latexTemplate = argument str (metavar "LATEX" <> help "Path to LaTeX template")

parser = Arguments <$> jsonFile <*> latexTemplate


main :: IO ()
main = do
    args <- execParser $ info parser fullDesc 
    return ()
