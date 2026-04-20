// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract EcoBadge is ERC721, Ownable {

    uint256 private _tokenIds;

    constructor() 
        ERC721("EcoBadge", "ECOB") 
        Ownable(msg.sender)
    {}

    function safeMint(address to) public {
        _tokenIds++;
        _safeMint(to, _tokenIds);
    }
}