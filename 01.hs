-- [haskell-language-server/README.md at master · haskell/haskell-language-server]( https://github.com/haskell/haskell-language-server/blob/master/plugins/hls-eval-plugin/README.md )

myLast :: [Int] -> Int
myLast [] = error "no last for empty list"
myLast [x] = x
myLast (_ : xs) = myLast xs

-- >>> myLast []
-- no last for empty list

-- >>> myLast [1, 2, 3]
-- 3
