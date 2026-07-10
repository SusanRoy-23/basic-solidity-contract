// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IToken {

    function transfer(address to, uint256 amount) external returns(bool);

    function transferFrom(address from, address to, uint256 amount) external returns(bool);
}

contract TokenBank {

    IToken public token;

    mapping(address => uint256) public balances;

    event Deposit(address indexed user, uint256 amount);
    event Withdraw(address indexed user, uint256 amount);

    constructor(address tokenAddress) {
        token = IToken(tokenAddress);
    }

    function deposit(uint256 amount) public {

        require(amount > 0, "Amount must be greater than zero");

        token.transferFrom(msg.sender, address(this), amount);

        balances[msg.sender] += amount;

        emit Deposit(msg.sender, amount);
    }

    function withdraw(uint256 amount) public {

        require(balances[msg.sender] >= amount, "Insufficient balance");

        balances[msg.sender] -= amount;

        token.transfer(msg.sender, amount);

        emit Withdraw(msg.sender, amount);
    }

    function getMyBalance() public view returns(uint256){
        return balances[msg.sender];
    }
}