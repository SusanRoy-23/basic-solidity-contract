// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IToken {//It only tells us which functions exist.

    function transfer(address to, uint256 amount) external returns(bool);//This function sends tokens.Can only be called from outside this contract.

    function transferFrom(address from, address to, uint256 amount) external returns(bool);//This transfers tokens from someone else's account, provided they have already approved it.
}

contract TokenBank {//Now we're creating the actual smart contract.

    IToken public token;//we're creating a variable called token.

    mapping(address => uint256) public balances;//This stores every user's deposited tokens. like a database

    event Deposit(address indexed user, uint256 amount);//Whenever someone deposits tokens, this event is emitted.
    event Withdraw(address indexed user, uint256 amount);//When someone withdraws

    constructor(address tokenAddress) {//Runs only once, when the contract is deployed.
        token = IToken(tokenAddress);//This converts the address into an IToken object.
    }

    function deposit(uint256 amount) public { //Allows users to deposit tokens into the bank.

        require(amount > 0, "Amount must be greater than zero");//checks if false transaction stops

        token.transferFrom(msg.sender, address(this), amount);//The user calling the function.//"The address of this TokenBank contract."

        balances[msg.sender] += amount;//old

        emit Deposit(msg.sender, amount);//Creates a blockchain log.
    }

    function withdraw(uint256 amount) public {//Allows users to take back their deposited tokens.

        require(balances[msg.sender] >= amount, "Insufficient balance");//Suppose Susan deposited 100 trying to withdraw 300 fails

        balances[msg.sender] -= amount;//Reduce deposited balance.

        token.transfer(msg.sender, amount);//This is different from transferFrom() 

        emit Withdraw(msg.sender, amount);//Stores withdrawal event.
    } 

    function getMyBalance() public view returns(uint256){// returns the balance 
        return balances[msg.sender];//if Susan deposited 300 when calling getmybalance 300 returns.
    }
}