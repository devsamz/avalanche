# Bank Smart Contract

This Solidity smart contract implements a simple banking system with functionalities for depositing, withdrawing, and transferring Ether.

## Features

- **Deposit Ether:** Allows users to deposit Ether into the contract.
- **Withdraw Ether:** Allows users to withdraw their deposited Ether.
- **Transfer Ether:** Allows users to transfer Ether to another address.

## Error Handling

- **`require()`:** Ensures the deposit amount is greater than zero and restricts balance checks to the owner.
- **`assert()`:** Ensures the initial balance is sufficient for withdrawals.
- **`revert()`:** Handles invalid addresses and insufficient balances in transfers.

## Functions

1. **deposit()**
   Deposits Ether into the sender's account.
   
2. **withdraw(uint256 amount)**
   Withdraws Ether from the sender's account.

3. **transfer(address to, uint256 amount)**
   Transfers Ether to the recipient's address.

## License

This project is licensed under the MIT License.