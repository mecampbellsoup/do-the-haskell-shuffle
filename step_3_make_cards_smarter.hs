-- Step 3: Make The Cards Smarter

data Suit = Club | Diamond | Heart | Spade
    deriving (Read, Show, Enum, Eq, Ord, Bounded)

data CardValue = Two | Three | Four
     | Five | Six | Seven | Eight | Nine | Ten
     | Jack | Queen | King | Ace
    deriving (Read,  Show, Enum, Eq, Ord, Bounded)

data Card = Card { value :: CardValue,
                    suit :: Suit }
    deriving (Read, Show, Eq, Bounded)

{-|
  Since we have explicitly bound the types for value/suit to CardValue/Suit, respectively,
  any derived typeclasses for Card must also be derived in CardValue and Suit...
  (think composition of functions)
-}

instance Ord Card where
    compare c1 c2 = compare (suit c1, value c1) (suit c2, value c2)
    -- here we have defined the Ord typeclass instance for the Card data type
    -- it will first compare values, and then suits
    -- POP QUIZ: how would we reverse that behavior, i.e. comparing suits before values?
    -- e.g. I want the Three of Spades to be > Queen of Clubs :)

instance Enum Card where
    toEnum n  = let (v,s) = n `divMod` 4 in Card (toEnum v) (toEnum s)
    fromEnum c = fromEnum (value c) * 4 + fromEnum (suit c)

-- We know a deck is a list of cards, so let's make it read that way!
type Deck = [Card]

deck :: Deck
deck = [Card val su | val <- [Two .. Ace], su <- [Club .. Spade]]

