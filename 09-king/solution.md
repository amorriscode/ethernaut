# King

The contract below represents a very simple game: whoever sends it an amount of ether that is larger than the current prize becomes the new king. On such an event, the overthrown king gets paid the new prize, making a bit of ether in the process! As ponzi as it gets xD

Such a fun game. Your goal is to break it.

When you submit the instance back to the level, the level is going to reclaim kingship. You will beat the level if you can avoid such a self proclamation.

## Solution

> Contracts that receive Ether directly (without a function call, i.e. using send or transfer) but do not define a fallback function throw an exception, sending back the Ether (this was different before Solidity v0.4.0). So if you want your contract to receive Ether, you have to implement a payable fallback function.

The [docs warn us](https://solidity.readthedocs.io/en/v0.5.3/contracts.html#fallback-function) that fallback functions that aren't payable will fail when transactions are send to them. The King contract wants to send money to the king after they are dethroned. Knowing this we can solve the problem.

1. Created a `KingSlayer` contract that sends 1 ETH to the contract; it's fallback is not payable and therefore destroys the throne
