// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Test} from "../lib/forge-std/src/Test.sol";
import {ERC1967Proxy} from "../lib/openzeppelin-contracts/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import {ChangeVariableOrder_V1} from "../src/ChangeVariableOrder_V1.sol";
import {ChangeVariableOrder_V2} from "../src/ChangeVariableOrder_V2.sol";
import {ChangeVariableOrder_V1_Test} from "./ChangeVariableOrder_V1.t.sol";

contract ChangeVariableOrder_V2_Test is ChangeVariableOrder_V1_Test {
    ChangeVariableOrder_V2 public impl_v2;
    ChangeVariableOrder_V2 public v2;

    function setUp() public virtual override {
        super.setUp();

        vm.startPrank(ownerAddress);
        impl_v2 = new ChangeVariableOrder_V2();
        v1.upgradeTo(address(impl_v2));
        v2 = ChangeVariableOrder_V2(address(erc1967proxy));
        vm.stopPrank();
    }

    // ❌ This will fail! The `slotShifter` variable now holds the value previously held by `number`.
    function testSlotStorage() public {
        assertEq(v2.slotShifter(), 0);
    }

    // ❌ This will fail!
    // The `number` variable is now in a new storage slot and therefore reset to the default value of 0.
    function testCurrentNumber() public {
        assertEq(v2.number(), 99);
    }
}
