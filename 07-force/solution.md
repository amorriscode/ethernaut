# Force

Some contracts will simply not take your money ¯\_(ツ)_/¯

The goal of this level is to make the balance of the contract greater than zero.

## Solution

The [Solidity docs explain](https://solidity.readthedocs.io/en/v0.4.24/contracts.html#fallback-function) that a contract without a fallback function can receive funds as a destination of a `selfdestruct` call.

1. Created a `ForceBalance` contract that can receive ETH via a fallback function
2. Create `pushTheBalance` function that selfdestructs to an address
3. Sent `ForceBalance` some ETH
4. Called `pushTheBalance` with the address of the Ethernaut contract to force the balance
