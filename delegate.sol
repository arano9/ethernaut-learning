// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Delegate {

  address public owner;

  constructor(address _owner) public {
    owner = _owner;
  }

  function pwn() public {
    owner = msg.sender;
  }
}

contract Delegation {

  address public owner;
  Delegate delegate;

  constructor(address _delegateAddress) public {
    delegate = Delegate(_delegateAddress);
    owner = msg.sender;
  }

  fallback() external {
    (bool result,) = address(delegate).delegatecall(msg.data);
    if (result) {
      this;
    }
  }

}

contract D {

   function sig() public pure  returns  ( bytes memory)  {
        return abi.encodeWithSignature("function pwn()");
    }
}