// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {UUPSUpgradeable} from "../lib/openzeppelin-contracts-upgradeable/contracts/proxy/utils/UUPSUpgradeable.sol";
import {OwnableUpgradeable} from "../lib/openzeppelin-contracts-upgradeable/contracts/access/OwnableUpgradeable.sol";

contract ChangeVariableOrder_V2 is UUPSUpgradeable, OwnableUpgradeable {
    uint256 public slotShifter; // Adding this variable shifts the storage slot of `number` in the proxy
    uint256 public number;

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }

    /**
     * @notice Limits upgradeability to the owner role
     * @param newImplementation The new implementation address
     */
    function _authorizeUpgrade(address newImplementation) internal virtual override onlyOwner {}
}
