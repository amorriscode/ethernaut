# Elevator

This elevator won't let you reach the top of your building. Right?

```solidity
pragma solidity ^0.4.18;


interface Building {
  function isLastFloor(uint) view public returns (bool);
}


contract Elevator {
  bool public top;
  uint public floor;

  function goTo(uint _floor) public {
    Building building = Building(msg.sender);

    if (! building.isLastFloor(_floor)) {
      floor = _floor;
      top = building.isLastFloor(floor);
    }
  }
}
```

## Solution

1. Create a `Building` contract
2. The second time the `Elevator` checks if you are on the last floor, set it to true
