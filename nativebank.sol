// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract NativeBank {

    mapping(address => uint256) public balances;

    event Deposit(address indexed user, uint256 amount);
    event Withdraw(address indexed user, uint256 amount);

    function deposit() public payable {
        require(msg.value > 0, "Send some ETH");

        balances[msg.sender] += msg.value;

        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");

        balances[msg.sender] -= amount;

        payable(msg.sender).transfer(amount);

        emit Withdraw(msg.sender, amount);
    }

    function getContractBalance() public view returns(uint256) {
        return address(this).balance;
    }

    function getMyBalance() public view returns(uint256) {
        return balances[msg.sender];
    }
}