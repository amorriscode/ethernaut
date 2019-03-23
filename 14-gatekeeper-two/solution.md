# Gatekeeper Two

This gatekeeper introduces a few new challenges. Register as an entrant to pass this level.

```solidity
pragma solidity ^0.4.18;

contract GatekeeperTwo {

  address public entrant;

  modifier gateOne() {
    require(msg.sender != tx.origin);
    _;
  }

  modifier gateTwo() {
    uint x;
    assembly { x := extcodesize(caller) }
    require(x == 0);
    _;
  }

  modifier gateThree(bytes8 _gateKey) {
    require(uint64(keccak256(msg.sender)) ^ uint64(_gateKey) == uint64(0) - 1);
    _;
  }

  function enter(bytes8 _gateKey) public gateOne gateTwo gateThree(_gateKey) returns (bool) {
    entrant = tx.origin;
    return true;
  }
}
```

## Solution

1. Create a new contract to execute attack (`GateSmasher`); this will bypass the first gate
2. Solve gate three by switching up the XOR (see `GateSmasher.sol` for details)
3. [Execute the attack in the constructor for `GateSmasher` to have a `extcodesize` of 0](https://ethereum.stackexchange.com/a/65060)
