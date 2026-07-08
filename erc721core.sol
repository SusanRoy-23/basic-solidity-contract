// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleNFT {

    string public name = "MyNFT";
    string public symbol = "MNFT";

    uint public totalSupply;

    mapping(uint => address) public ownerOf;
    mapping(address => uint) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint indexed tokenId);

    function mint() public {
        totalSupply++;
        ownerOf[totalSupply] = msg.sender;
        balanceOf[msg.sender]++;

        emit Transfer(address(0), msg.sender, totalSupply);
    }

    function transfer(address to, uint tokenId) public {
        require(ownerOf[tokenId] == msg.sender, "Not owner");

        ownerOf[tokenId] = to;
        balanceOf[msg.sender]--;
        balanceOf[to]++;

        emit Transfer(msg.sender, to, tokenId);
    }
}