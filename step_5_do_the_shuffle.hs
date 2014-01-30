-- Step 5: Do the Shuffle!

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

buildDeck :: (Suit, CardValue) -> Deck
buildDeck (downToSuit, downToCard) = [Card val su | val <- [downToCard .. Ace], su <- [downToSuit .. Spade]]

-- interlace two decks of the same size
interlace :: Deck -> Deck -> Deck
interlace [] [] = []
interlace (c1:d1) (c2:d2) = [c1,c2] ++ interlace d1 d2

{-|
    (c1:d1) is called an 'as pattern'
    where c1 takes on the vale of the list's head
    and c2 takes on the value of the list's tail
-}

{-|
    "perfect out" shuffle, where:
    (1, 2,..., n, n+1, n+2,..., 2n)
    becomes:
    (1, n+1, 2, n+2,..., n, 2n)
-}
outShuffle :: Deck -> Deck
outShuffle deck = interlace deck1 deck2
                  where n = (length deck) `div` 2
                        deck1 = fst (splitAt n deck)
                        deck2 = snd (splitAt n deck)

{-|
    "perfect in" shuffle, where:
    (1, 2,..., n, n+1, n+2,..., 2n)
    becomes:
    (n+f, 1, n+2, 2,..., 2n, n)
-}
inShuffle :: Deck -> Deck
inShuffle deck = interlace deck2 deck1
                 where n = (length deck) `div` 2
                       deck1 = fst (splitAt n deck)
                       deck2 = snd (splitAt n deck)

-- function to perform a shuffle type on a given deck n times
shuffleNTimes :: Int -> (Deck -> Deck) -> Deck -> Deck
shuffleNTimes n shuffleFunc deck = (iterate shuffleFunc deck) !! n

-- reverse function to check our shuffles...
reverse' :: Deck -> Deck
reverse' [] = []
reverse' [x] = [x]
reverse' xs = last xs : reverse' (init xs)
