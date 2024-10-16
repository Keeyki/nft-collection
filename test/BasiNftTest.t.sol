// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Test} from "lib/forge-std/src/Test.sol";
import {DeployBasicNft} from "script/DeployBasicNft.s.sol";
import {basicNft} from "src/basicNft.sol";

contract BasicNftTest is Test {
    DeployBasicNft public deployer;
    basicNft public BasicNft;
    address public USER = makeAddr("user");
    address public RECIPIENT = makeAddr("recipient");
    string public constant PUG =
        "https://ipfs.io/ipfs/QmQnWFjZ3T1NhNqHiXb8f5pGSH26YDzmcdBvqkMTq4xCCG?filename=robot%20nft.jpeg";

    function setUp() public {
        deployer = new DeployBasicNft();
        BasicNft = deployer.run();
    }
    function testNameIsCorrect() public view {
        string memory expectedName = "Z-Robot";
        string memory actualName = BasicNft.name();
        assert(
            keccak256(abi.encodePacked(expectedName)) ==
                keccak256(abi.encodePacked(actualName))
        );
    }
    function testCanMintAndGetBalance() public {
        vm.prank(USER);
        BasicNft.mintNft(PUG);
        assert(BasicNft.balanceOf(USER) == 1);
        assert(
            keccak256(abi.encodePacked(PUG)) ==
                keccak256(abi.encodePacked(BasicNft.tokenURI(0)))
        );
    }
    function testCanTransfer() public {
        vm.prank(USER);
        BasicNft.mintNft(PUG);
        BasicNft.transferFrom(USER, RECIPIENT, 2);
        assertEq(BasicNft.ownerOf(2), RECIPIENT);
    }
}
