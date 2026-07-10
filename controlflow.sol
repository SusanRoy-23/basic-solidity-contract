// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ControlFlowExample {

    // -------------------------
    // 1. if / else
    // -------------------------
    function checkNumber(uint num) public pure returns (string memory) {

        if (num > 50) {
            return "Number is greater than 50";
        } else {
            return "Number is 50 or less";
        }
    }

    // -------------------------
    // 2. for loop
    // Adds numbers from 1 to 5
    // -------------------------
    function forLoopExample() public pure returns (uint) {

        uint sum = 0;

        for (uint i = 1; i <= 5; i++) {
            sum += i;
        }

        return sum; // 15
    }

    // -------------------------
    // 3. while loop
    // Adds numbers from 1 to 5
    // -------------------------
    function whileLoopExample() public pure returns (uint) {

        uint sum = 0;
        uint i = 1;

        while (i <= 5) {
            sum += i;
            i++;
        }

        return sum; // 15
    }

    // -------------------------
    // 4. do-while loop
    // Runs at least once
    // -------------------------
    function doWhileExample() public pure returns (uint) {

        uint count = 0;

        do {
            count++;
        } while (count < 5);

        return count; // 5
    }

    // -------------------------
    // 5. break
    // Stops loop when i == 5
    // -------------------------
    function breakExample() public pure returns (uint) {

        uint sum = 0;

        for (uint i = 1; i <= 10; i++) {

            if (i == 5) {
                break;
            }

            sum += i;
        }

        return sum; // 10 (1+2+3+4)
    }

    // -------------------------
    // 6. continue
    // Skips number 5
    // -------------------------
    function continueExample() public pure returns (uint) {

        uint sum = 0;

        for (uint i = 1; i <= 10; i++) {

            if (i == 5) {
                continue;
            }

            sum += i;
        }

        return sum; // 50
    }

}