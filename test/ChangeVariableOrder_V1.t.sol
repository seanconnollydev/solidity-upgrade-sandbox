// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Test} from "../lib/forge-std/src/Test.sol";
import {ERC1967Proxy} from "../lib/openzeppelin-contracts/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import {ChangeVariableOrder_V1} from "../src/ChangeVariableOrder_V1.sol";

contract ChangeVariableOrder_V1_Test is Test {
    address public ownerAddress = makeAddr("owner");
    ChangeVariableOrder_V1 public impl_v1;
    ChangeVariableOrder_V1 public v1;
    ERC1967Proxy public erc1967proxy;

    function setUp() public virtual {
        vm.startPrank(ownerAddress);
        impl_v1 = new ChangeVariableOrder_V1();
        bytes memory initializeCall = abi.encode(impl_v1.initialize.selector);

        erc1967proxy = new ERC1967Proxy(address(impl_v1), initializeCall);

        v1 = ChangeVariableOrder_V1(address(erc1967proxy));
        v1.setNumber(99);
        vm.stopPrank();
    }

    function testIncrement() public {
        v1.increment();
        assertEq(v1.number(), 100);
    }

    function testSetNumber(uint256 x) public {
        v1.setNumber(x);
        assertEq(v1.number(), x);
    }
}
