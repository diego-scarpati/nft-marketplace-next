// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ERC721 {

  event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

  mapping(uint256 => address) private _tokenOwner;
  mapping(address => uint256) private _ownedTokensByAddress;

  function _exists(uint256 tokenId) internal view returns(bool) {
    return _tokenOwner[tokenId] != address(0);
  }

  function _mint(address to, uint256 tokenId) internal {
    require(to != address(0), "the to address must not be 0");
    require(!_exists(tokenId), "token already exists");
    _tokenOwner[tokenId] = to;
    _ownedTokensByAddress[to] ++;

    emit Transfer(address(0), to, tokenId);
  }
}