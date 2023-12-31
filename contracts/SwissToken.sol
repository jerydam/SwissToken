// SPDX-License-Identifier: MIT

// This is considered an Exogenous, Decentralized, Anchored (pegged), Crypto Collateralized low volitility coin

// Layout of Contract:
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions

pragma solidity ^0.8.18;

import {ERC20Burnable, ERC20} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
/* 
 * @title SwissToken stable coin
 * @ author Jerydam
*/

contract SwisstronikCoin is ERC20Burnable, Ownable {
    error DecentralizedStableCoin_MustBeMoreThanZero();
    error DecentralizedStableCoin_BurnAmountExceedsBalance();
    error DecentralizedStableCoin_NotZeroAddress();

    constructor() ERC20("Swisstronik Token", "STT") {}

    function burn(uint256 _amount) public override onlyOwner {
        uint256 balance = balanceOf(msg.sender);
        if (_amount <= 0) {
            revert DecentralizedStableCoin_MustBeMoreThanZero();
        }
        if (balance < _amount) {
            revert DecentralizedStableCoin_BurnAmountExceedsBalance();
        }
        super.burn(_amount);
    }
function mint(address _to, uint256 _amount) external onlyOwner returns (bool) {
    if (_to == address(0)) {
        revert DecentralizedStableCoin_NotZeroAddress();
    }
    if (_amount <= 0) {
        revert DecentralizedStableCoin_MustBeMoreThanZero();
    }

    // Multiply _amount by 10^18
    uint256 amountToMint = _amount * 10**18;

    // Call the _mint function with the modified amount
    _mint(_to, amountToMint);

    return true;
}

}
