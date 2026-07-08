//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;
contract Basic{
    uint public count;
    function increment() public{
        count++; //count=count+1
    }
    function decrement() public{
        count--;
    }

}
