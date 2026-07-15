//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;
contract PiggyBank{
    mapping(address => uint) // the key is an ethereum wallet address
    public balance;

    function deposit() public payable{//anyone can call it, without payable the function cannot receive ether. 
        balance[msg.sender] += msg.value;//the wallet address that called the function, the amount of ether sent with the transaction
    }
    function withdraw(uint amount) public{
        require(balance[msg.sender] >= amount, "insufficient balance");
        balance[msg.sender]-= amount;

        payable (msg.sender).transfer(amount);
    }
    function contractBalance()
    public view returns(uint){
        return 
        address(this).balance;
    }
}