# Intro to Haskell: Types & Typeclasses

## Inspiration: [Learn You a Haskell](http://learnyouahaskell.com/)

Thanks for checking out my repo! Haskell is tough to learn at first, but it really stretches your mind. You will feel more "mentally flexible" after you've started working through some Haskell code!

I've added 5 files to this repo, which are *steps* to progress through learning about types and typeclasses.

## Installation

First, if you don't have Haskell yet, you'll need to get ready to run the [The Glasgow Haskell Compiler (GHCI)](http://www.haskell.org/haskellwiki/GHC/GHCi).

Assuming you're on a Mac and you have [Homebrew](http://brew.sh/) installed, run the following commands:

```bash
$> brew install haskell-platform
```

To confirm that worked, try the following:
```bash
$> which ghci
```

If that returns something like `/usr/local/bin/ghci` then you're ready to rock!

## Usage

First, you'll need to fork or clone this repo. (I'd suggest fork, in case you want to make pull requests with changes.)

```bash
$> git clone git@github.com:mecampbellsoup/do-the-haskell-shuffle.git
```

Now that we have the repo locaclly, and the Haskell compiler installed, let's get inside the GHCi REPL:

```bash
$> gchi
```

From inside of GCHI, you can load each 'step' or file in this repo by the following command (just make sure the argument you give to `:load` points to the correct file location):
```bash
Prelude > :load step_1_make_the_deck.hs
[1 of 1] Compiling Main             ( step_1_make_the_deck.hs, interpreted )
Ok, modules loaded: Main.
```
Awesome - now you can mess around with the newly-compiled Haskell program, for example:
```bash
Prelude > :type Diamond
Diamond :: Suit

Prelude > :type Queen
Queen :: CardValue

Prelude > :kind Suit
Suit :: *

Prelude > :kind CardValue
CardValue :: *

Prelude > :t Pikachu
Pikachu :: Pokemon

Prelude > :t deck
deck :: [(CardValue, Suit)]

Prelude > show Jigglypuff
"Jigglypuff"
```

## Follow the steps!
You're well on your way! From here, just follow the files as steps:
```bash
λ > :load step_2_make_deck_smarter.hs
[1 of 1] Compiling Main             ( step_2_make_deck_smarter.hs, interpreted )
Ok, modules loaded: Main.
```
In each file/step, make sure you understand the new topics that get introduced.

When (not "if") you get stuck, these are your friends:

* Google.
* [Hoogle!](http://www.haskell.org/hoogle/)
* [Learn You a Haskell](http://learnyouahaskell.com/)
* StackOverflow
* Twitter (you can tweet me questions [@mecampbellsoup](https://twitter.com/mecampbellsoup))

## In Closing
Good luck, don't be afraid, and have fun!

