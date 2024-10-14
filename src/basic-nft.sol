// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import "lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

contract basicNft {
    uint256 private s_tokenCounter;
    constructor() ERC721("Zouzou", "ZOU") {
        s_tokenCounter = 0;
    }
    function mintNft(address _to) public {
        uint256 tokenId = s_tokenCounter;
        _safeMint(to, tokenId);
        s_tokenCounter = s_tokenCounter + 1;
    }
    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {}
}
