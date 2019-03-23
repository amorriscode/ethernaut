# Re-Entrancy

The goal of this level is for you to steal all the funds from the contract.

```solidity
pragma solidity ^0.4.18;

contract Reentrance {

  mapping(address => uint) public balances;

  function donate(address _to) public payable {
    balances[_to] += msg.value;
  }

  function balanceOf(address _who) public view returns (uint balance) {
    return balances[_who];
  }

  function withdraw(uint _amount) public {
    if(balances[msg.sender] >= _amount) {
      if(msg.sender.call.value(_amount)()) {
        _amount;
      }
      balances[msg.sender] -= _amount;
    }
  }

  function() public payable {}
}
```

## Solution

During withdrawl, the contract checks for a certain amount of balance. If there is enough balance, it will send it off. Perfect opportunity for a re-entrancy attack... _make sure to send enough gas_!

1. Created `ExecuteReentry` to deposit some funds then begin the withdraw recursion
2. Once the funds had been drained, you can deposit the funds into your own wallet with the `withdraw` function on `ExecuteReentry`
