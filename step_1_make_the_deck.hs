-- Step 1: Make the Deck... and some Pokemon :)

data Pokemon = Pikachu | Charmander | Squirtle | Jigglypuff
    deriving (Enum, Show, Read, Ord, Eq)

data Suit = Club | Diamond | Heart | Spade
    deriving (Show)

data CardValue = Two | Three | Four
     | Five | Six | Seven | Eight | Nine | Ten
     | Jack | Queen | King | Ace
     deriving (Show)

{-|
 NOTE:
 The part before the = denotes the data type.
 The parts after the = are value constructors.
-}

-- Our deck is just a list of tuples, specific tuples where the first tuple value is a CardValue and the second is a Suit
deck :: [(CardValue, Suit)]

-- Here we do a list comprehension to arrive at our list of "cards" (which are just tuples for now)
deck = [(val, su) | val <- [Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King, Ace], su <- [Club, Diamond, Heart, Spade]]
