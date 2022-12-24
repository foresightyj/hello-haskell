fac :: Int -> Int
fac 1 = 1
fac n = n * fac (n -1)


main = do
  putStrLn "what is your name?"
  line <- getLine
  if line == "leaving"
    then do
      print "Ok byebye"
      return ()
    else do
      print $ "hello " ++ line
      main
