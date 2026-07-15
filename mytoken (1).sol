//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;
contract MyToken{
    string public name="Susan Token";//token's official name
    string public symbol="SNT";//Every cryptocurrency has a short name.
    uint8 public decimals=18; //This tells wallets How many decimal places your token supports.One token can be divided into 18 decimal places

    uint256 public totalSupply; //this stores how many tokens exist initially (0)
    mapping(address => uint256)public balanceOf;// returns How many tokens that address owns.
    mapping(address => mapping(address =>uint256)) public allowance;// nested mapping- [owner-susan] [spender-amazon] [allowed amt]

    event Transfer(address indexed from, //susan
    address indexed to, //john
    uint256 amount);// 100

    event Approval(address indexed owner, //susan
    address indexed spender,//amazon
     uint256 amount);// 500

    constructor() {//contract gets deployed only once
        totalSupply = 1000 * 10 ** decimals;// decimals=18
        balanceOf[msg.sender] = totalSupply;//Who deployed the contract? balanceOf[susan]=1000 tokens
    }

    function transfer(address to, uint256 amount) public returns (bool) {//used to send own tokens- (receiver,amt) returns true if successful

        require(balanceOf[msg.sender] >= amount, "Not enough tokens");//checks Do you actually own enough tokens?

        balanceOf[msg.sender] -= amount; //Subtract tokens from sender. before 500 , after sending 100, now 400
        balanceOf[to] += amount;//Receiver gets them.

        emit Transfer(msg.sender, to, amount);//Creates a blockchain receipt. susan ->john-> 100

        return true;//Transfer succeeded.
    }

    function approve(address spender, uint256 amount) public returns (bool) { //Used to give permission.

        allowance[msg.sender][spender] = amount;//[susan] [amazon]=500

        emit Approval(msg.sender, spender, amount);//Blockchain stores the approval.

        return true;//Approval successful.
    }

    function transferFrom(address from, address to, uint256 amount) public returns (bool) {//I send someone else's tokens because they gave me permission. Susan approves Amazon->Amazon spends Susan's tokens

        require(balanceOf[from] >= amount, "Insufficient balance");//checks Does Susan actually have enough tokens?

        require(allowance[from][msg.sender] >= amount, "Allowance exceeded");//checks permission- permission 500 if trying 700 then exceeded

        balanceOf[from] -= amount;//Subtract from Susan.
        balanceOf[to] += amount;//Give to Shop.

        allowance[from][msg.sender] -= amount;//Reduce remaining permission. totl 500 spent 200 remaining 300

        emit Transfer(from, to, amount);//Blockchain records susan->shop->200

        return true;//Transfer completed successfully.
    }
}

