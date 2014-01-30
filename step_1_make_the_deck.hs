-- Step 1: Make the Deck

data Suit = Club | Diamond | Heart | Spade

data CardValue = Two | Three | Four
     | Five | Six | Seven | Eight | Nine | Ten
     | Jack | Queen | King | Ace

deck :: [(CardValue, Suit)]

deck = [(val, su) | val <- [Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King, Ace], su <- [Club, Diamond, Heart, Spade]]

{-|
 The part before the = denotes the data type.
 The parts after the = are value constructors.
-}

data Pokemon = Pikachu | Charmander | Squirtle | Jigglypuff
    deriving (Enum, Show, Read, Ord, Eq)
