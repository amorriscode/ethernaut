pragma solidity ^0.4.18;

contract ForceBalance {
    function pushTheBalance(address _force) public {
        selfdestruct(_force);
    }
    
    function () public payable {}
}
