// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Test} from "lib/forge-std/src/Test.sol";
import {DeployBasicNft} from "script/DeployBasicNft.s.sol";
import {basicNft} from "src/basicNft.sol";

contract BasicNft is Test {
    DeployBasicNft public deployer;
    basicNft public BasicNft;

    function setUp() public {
        deployer = new DeployBasicNft();
        BasicNft = deployer.run();
    }
}
