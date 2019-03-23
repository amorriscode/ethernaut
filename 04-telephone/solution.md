# Telephone

Claim ownership of the contract.

```solidity
pragma solidity ^0.4.18;

contract Telephone {

  address public owner;

  function Telephone() public {
    owner = msg.sender;
  }

  function changeOwner(address _owner) public {
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
  }
}
```

## Solution

1. Created a BruteOwnership contract that calls an abtract contract (Telephone)
2. Call the Telephone contract's `changeOwner` method with the `msg.sender` of my contract
