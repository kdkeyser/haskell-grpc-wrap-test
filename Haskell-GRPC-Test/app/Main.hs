module Main where

import Lib

myCallback :: IO ()
myCallback = do
  putStrLn "Hello there"

main :: IO ()
main = do
  f <- wrap myCallback
  thread <- callback f
  waitAndDestroy thread
