// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract Mint721_1 is ERC721Enumerable {
    string public URI;

    constructor(string memory _uri) ERC721("LikeLion721", "LL721_1") {
        URI = _uri;
    }

    function mintNFT(uint _tokenID) public {
        _mint(msg.sender, _tokenID);
    } 

    function tokenURI(uint _tokenID) public override view returns(string memory) {
        return string(abi.encodePacked(URI, '/', Strings.toString(_tokenID), '.json'));
    }
}