# Vault

Unlock the vault to pass the level!

```solidity
pragma solidity ^0.4.18;

contract Vault {
  bool public locked;
  bytes32 private password;

  function Vault(bytes32 _password) public {
    locked = true;
    password = _password;
  }

  function unlock(bytes32 _password) public {
    if (password == _password) {
      locked = false;
    }
  }
}
```

## Solution

> Everything that is inside a contract is visible to all observers external to the blockchain. Making something private only prevents other contracts from accessing and modifying the information, but it will still be visible to the whole world outside of the blockchain.

The [docs warn us](https://solidity.readthedocs.io/en/v0.5.3/contracts.html#visibility-and-getters) that everything in a contract is actually visible. Knowing this we can simply peek at the password.

1. Created `vault.js` to help me explore the storage within the contract
