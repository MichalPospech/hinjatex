{-# LANGUAGE OverloadedStrings #-}

module Main where

import Options.Applicative (argument, execParser, fullDesc, help, info, metavar, progDesc, str)
import Options.Applicative.Common (runParser)
import Options.Applicative.Types (Parser)

data Arguments = Arguments
  { json :: String,
    latex :: String,
    pdf :: String
  }

jsonFile :: Parser String
jsonFile = argument str (metavar "JSON" <> help "Path to JSON datafile")

latexTemplate :: Parser String
latexTemplate = argument str (metavar "LATEX" <> help "Path to LaTeX template")

pdfFile :: Parser String
pdfFile = argument str (metavar "PDF" <> help "Path to resulting PDF file")

parser = Arguments <$> jsonFile <*> latexTemplate <*> pdfFile

main :: IO ()
main = do
  args <- execParser $ info parser fullDesc
  jsonData <- readFile $ json args
  return ()