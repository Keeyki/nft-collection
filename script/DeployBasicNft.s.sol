// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Script} from "lib/forge-std/src/Script.sol";
import {basicNft} from "src/basicNft.sol";

contract DeployBasicNft is Script {
    function run() external returns (basicNft) {
        vm.startBroadcast();
        basicNft BasicNft = new basicNft();
        vm.stopBroadcast();
        return BasicNft;
    }
}
