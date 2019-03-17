# Re-Entrancy

The goal of this level is for you to steal all the funds from the contract.

## Solution

During withdrawl, the contract checks for a certain amount of balance. If there is enough balance, it will send it off. Perfect opportunity for a re-entrancy attack... _make sure to send enough gas_!

1. Created `ExecuteReentry` to deposit some funds then begin the withdraw recursion
2. Once the funds had been drained, you can deposit the funds into your own wallet with the `withdraw` function on `ExecuteReentry`
