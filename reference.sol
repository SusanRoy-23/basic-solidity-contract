// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ReferenceTypesExample {

    // 1. String
    string public studentName = "Susan";//string stores text.

    // 2. Bytes- bytes is dynamic, meaning its size can grow or shrink.
    bytes public message = "Hello";//stores binary data. Everything inside a computer is stored as bytes. 

    // 3. Dynamic Array
    uint[] public marks;//Size can increase or decrease.

    // 4. Struct
    struct Student {//groups different pieces of related information together.
        string name;
        uint age;
    }

    Student public student;

    // 5. Mapping
    mapping(address => uint) public balances;//stores key-value pairs.

    constructor() {
        // Initialize Struct
        student = Student("Susan", 20);

        // Add values to Array
        marks.push(90);
        marks.push(85);
        marks.push(95);

        // Set Mapping value
        balances[msg.sender] = 1000;
    }

    // Add a new mark
    function addMark(uint _mark) public {
        marks.push(_mark);
    }

    // Update student balance
    function deposit(uint _amount) public {
        balances[msg.sender] += _amount;
    }
}