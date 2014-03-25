-- Step 1: Crear la Baraja de Cartas

data Suit = Club | Diamond | Heart | Spade
    deriving (Show)

data CardValue = Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten | Jack | Queen | King | Ace
    deriving (Show)

{-|
 NOTE:
 The part before the = denotes the data type.
 The parts after the = are value constructors.
-}

-- Our deck is just a list of tuples, specific tuples where the first tuple value is a CardValue and the second is a Suit
-- Por ejemplo, los primeros 5 naipes serán: 
-- [(Two, Club), (Two, Diamond), (Two, Heart), (Two, Spade), (Three, Club)]
deck :: [(CardValue, Suit)]

-- Here we do a list comprehension to arrive at our list of "cards" (which are just tuples for now)
deck = [(val, su) | val <- [Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King, Ace]
                   , su <- [Club, Diamond, Heart, Spade]]
