// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Force {/*

                   MEOW ?
         /\_/\   /
    ____/ o o \
  /~____  =ø= /
 (______)__m_m)
*/
    function force() external {
        address  payable a=payable(0x3b3ba739fac1420bDF6DC0492B07Cc4a1097bf65);
        selfdestruct(a);
    }

    fallback() external payable{
        
    }
}