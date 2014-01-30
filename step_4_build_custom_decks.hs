-- Step 4: Build Custom Decks

data Suit = Club | Diamond | Heart | Spade
    deriving (Read, Show, Enum, Eq, Ord, Bounded)

data CardValue = Two | Three | Four
     | Five | Six | Seven | Eight | Nine | Ten
     | Jack | Queen | King | Ace
    deriving (Read,  Show, Enum, Eq, Ord, Bounded)

data Card = Card { value :: CardValue,
                    suit :: Suit }
    deriving (Read, Show, Eq, Bounded)

instance Ord Card where
    compare c1 c2 = compare (value c1, suit c1) (value c2, suit c2)
    -- here we have defined the Ord typeclass instance for the Card data type
    -- it will first compare values, and then suits
    -- how would we reverse that behavior, i.e. comparing suits before values?
    -- e.g. I want the Three of Spades to be > Queen of Clubs :)

instance Enum Card where
    toEnum n  = let (v,s) = n `divMod` 4 in Card (toEnum v) (toEnum s)
    fromEnum c = fromEnum (value c) * 4 + fromEnum (suit c)

type Deck = [Card]

deck :: Deck
deck = [Card val su | val <- [Two .. Ace], su <- [Club .. Spade]]

-- Here's our function for building a custom deck
-- We use pattern matching to simplify the function's signature
-- However, because of this design we won't be able to partially apply this function...
buildDeck :: (Suit, CardValue) -> Deck
buildDeck (downToSuit, downToCard) = [Card val su | val <- [downToCard .. Ace], su <- [downToSuit .. Spade]]

