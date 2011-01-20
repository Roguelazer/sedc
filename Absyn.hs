module Absyn where

data Cmd = Print | Print_P | Label String
         | Sub Regex String
           deriving (Show)

data Address = DirectAddress Int
             | AddressRange Address Address
	     | AddressRE Regex
               deriving (Show)

data Regex = RELiteral String
              deriving (Show)

data Statement = Block [Statement]
               | AddressedCommand Address Statement
	       | Command Cmd
	         deriving (Show)
