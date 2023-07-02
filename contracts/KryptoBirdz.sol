// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ERC721Connector.sol";

contract KryptoBird is ERC721Connector {

  string[] public kryptobirdz;

  mapping(string => bool) kryptobirdzExists;

  modifier checkIfNFTExists (string memory id) {
    require(!kryptobirdzExists[id], "NFT already exists");
    _;
  }

  function mint (string memory kryptobird) public checkIfNFTExists(kryptobird) {

    kryptobirdz.push(kryptobird);
    uint256 id = kryptobirdz.length - 1;

    _mint(msg.sender, id);

    kryptobirdzExists[kryptobird] = true;
  }
  constructor() ERC721Connector("Kryptobird", "KBIRDZ") {}
}
