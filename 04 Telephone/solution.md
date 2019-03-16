# Telephone

Claim ownership of the contract.

## Solution

1. Created a BruteOwnership contract that calls an abtract contract (Telephone)
2. Call the Telephone contract's `changeOwner` method with the `msg.sender` of my contract
