-- Step 2: Make the Deck Smarter

data Suit = Club | Diamond | Heart | Spade
    deriving (Read, Show, Enum, Eq, Ord, Bounded)

data CardValue = Two | Three | Four
     | Five | Six | Seven | Eight | Nine | Ten
     | Jack | Queen | King | Ace
    deriving (Read,  Show, Enum, Eq, Ord, Bounded)

data Card = Card { value :: CardValue,
                    suit :: Suit }
    deriving (Read, Show, Eq, Bounded)

deck :: [Card]
deck = [Card val su | val <- [Two .. Ace], su <- [Club .. Spade]]

{-|
 The parts after the word "deriving" are type classes, the behaviors we want to make available to our data type

 Suit and CardValue use deriving clauses to allow us to:
  * convert instances of each to / from IO String (Read, Show)
    e.g. show Ten, show Spade
    e.g. read "Ten" :: CardValue, read "Spade" :: Suit

  * list, order, and compare instances for equality (Enum, Eq, Ord)
    e.g. Three is less than Queen
    e.g. Club is less than Heart

 With types like this (where there are no type variables),
 equality is based upon which constructor is used,
 and order is determined by the order you wrote them.
-}
