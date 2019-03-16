# Coin Flip

This is a coin flipping game where you need to build up your winning streak by guessing the outcome of a coin flip. To complete this level you'll need to use your psychic abilities to guess the correct outcome 10 times in a row.

## Solution

1. Copied the contract code so I could "predict" the next flip using the same code
2. Ran my CoinFlipPredictor on Remix 10 times
3. Confirmed consecutive 10 wins using `await contract.consecutiveWins()`

_Note: I used an abstract contract which appears to be the [preferred method for calling contracts](https://ethereum.stackexchange.com/a/11481). This is because `call` and friends break the type-safety of Solidity._