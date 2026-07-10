// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract VariablesExample {

    // -------------------------
    // State Variables
    // -------------------------
    string public name = "Susan";//declared inside the contract but outside any function
    uint public age = 20;//stored permanently on blockchain

    // -------------------------
    // Constant Variable
    // -------------------------
    uint public constant MAX_AGE = 100;//can never change after it is declared

    // -------------------------
    // Immutable Variable
    // -------------------------
    address public immutable owner;//after deployment it cannot be changed

    // Constructor
    constructor() {
        owner = msg.sender;
    }

    // -------------------------
    // Local Variable
    // -------------------------
    function calculateSum() public pure returns (uint) {
        uint sum = 10 + 20; // Local variable, declared inside a function
        return sum;// after the function finishes the result no longer exists
    }

    // -------------------------
    // Global Variables
    // -------------------------
    function getCaller() public view returns (address) {//built into solidity
        return msg.sender;//they give information about the current transaction.
    }

    function getBlockNumber() public view returns (uint) {
        return block.number;
    }

    function getTimestamp() public view returns (uint) {
        return block.timestamp;
    }

    function deposit() public payable returns (uint) {
        return msg.value;
    }
}