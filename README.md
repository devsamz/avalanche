# My Token Contract

- **Name:** Ore Token
- **Symbol:** OTK

## Descripion

This is an ERC-20 called `OreToken` with symbol `OTK`. The Contract inherits OpenZeppelin ERC20 standard, with extra implementation to mint, burn and transfer.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., HelloWorld.sol). Copy and paste the following code into the file:

```javascript
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract OreToken is ERC20 {
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can mint");
        _;
    }

    constructor() ERC20("OreToken", "ORK") {
        owner = msg.sender;
    }

    function mint(address _to, uint256 _amount) public onlyOwner {
        _mint(_to, _amount * (10 ** decimals()));
    }

    function transfer(address to, uint256 value) public virtual override returns (bool success) {
        require(balanceOf(msg.sender) >= value, "Insufficient balance");
        success = super.transfer(to, value);
    }

    function burn(uint256 _amount) public {
        require(balanceOf(msg.sender) >= _amount, "Insufficient balance");
        _burn(msg.sender, _amount);
    }
}

```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.20" (or another compatible version), and then click on the "Compile OreToken.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "OreToken" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the mint, burn and transfer function.


## Contract Details

### Constructor

During Constructor time, The ERC-20 token name and symbol is set. Also the deployer become the owner of the contract.

### mint

The mint function allows new tokens to be generated and sent to a specified address. This function can only be called by the contract owner.

### transfer

Allows holders of the token to transfer an amount of the token to another address provided that their balance is greater than that amount.

### burn

This function allows the holders to burn a specified amount, hence erasing it from the total supply. Holders must have sufficient amount to burn

## Authors

Samuel Dahunsi

## License

This project is licensed under the MIT License
