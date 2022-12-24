{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Used otherwise as a pattern" #-}
import Data.List (intercalate)
import Distribution.InstalledPackageInfo (parseInstalledPackageInfo)
import System.Environment
import Text.Printf
import Text.Read (readMaybe)

-- read two arguments from command line args and add them if they are both numbers

parseInt s = readMaybe s :: Maybe Int

add :: String -> String -> String
add op1 op2 = "hello"

-- >>> parseInt "13"
-- Just 13
-- >>> parseInt "hi"
-- Nothing

parseArgs :: [String] -> Either String Int
parseArgs args =
  -- see [Is there any haskell function to concatenate list with separator? - Stack Overflow]( https://stackoverflow.com/questions/9220986/is-there-any-haskell-function-to-concatenate-list-with-separator )
  let twoArgs = case args of
        [op1, op2] -> Right (op1, op2)
        otherwise ->
          let len = length args
              err = printf "Must have exactly 2 args but received: %d" len :: String
           in Left err
   in do
        (op1, op2) <- twoArgs
        case (parseInt op1, parseInt op2) of
          (Just o1, Just o2) -> Right $ o1 + o2
          otherwise -> let err = printf "Some args are not integer" in Left err

-- see [Functional-Programming/Tips_And_Tricks.org at master · caiorss/Functional-Programming]( https://github.com/caiorss/Functional-Programming/blob/master/haskell/Tips_And_Tricks.org#using-pattern-matching-for-simple-command-line-application )
main = do
  args <- getArgs
  putStrLn $ "Calculating: " ++ intercalate " + " args
  let res = parseArgs args
  case res of
    Left err -> putStrLn err
    Right s -> printf "Result: %s\n" $ show s
  return ()
