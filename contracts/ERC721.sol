// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ERC721 {

  event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

  mapping(uint256 => address) private _tokenOwner;
  mapping(address => uint256) private _ownedTokensByAddress;

  /// @notice Count all NFTs assigned to an owner
  /// @dev NFTs assigned to the zero address are considered invalid, and this
  ///  function throws for queries about the zero address.
  /// @param _owner An address for whom to query the balance
  /// @return The number of NFTs owned by `_owner`, possibly zero
  function balanceOf(address _owner) external view returns(uint256) {
    require(_owner != address(0), "The addres must not be 0");
    return _ownedTokensByAddress[_owner];
  }

  /// @notice Find the owner of an NFT
  /// @dev NFTs assigned to zero address are considered invalid, and queries
  ///  about them do throw.
  /// @param _tokenId The identifier for an NFT
  /// @return The address of the owner of the NFT
  function ownerOf(uint256 _tokenId) external view returns(address) {
    require (_tokenOwner[_tokenId] != address(0), "Invalid token as it is owned by a zero address");
    return _tokenOwner[_tokenId];
  }

  function _exists(uint256 tokenId) internal view returns(bool) {
    return _tokenOwner[tokenId] != address(0);
  }

  function _mint(address to, uint256 tokenId) internal virtual {
    require(to != address(0), "the to address must not be 0");
    require(!_exists(tokenId), "token already exists");
    _tokenOwner[tokenId] = to;
    _ownedTokensByAddress[to] ++;

    emit Transfer(address(0), to, tokenId);
  }
}