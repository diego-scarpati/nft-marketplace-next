// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Migrations {
  address public owner = msg.sender;
  uint public last_migration_completed;

  modifier restricted() {
    require(msg.sender == owner, "This function is restricted to the contract's owner!");
    _;
  }

  function setCompleted(uint completed) public restricted {
    last_migration_completed = completed;
  }

  function upgrade(address new_address) public restricted {
    Migrations upgraded = Migrations(new_address);
    upgraded.setCompleted(last_migration_completed);
  }
}