// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {

    struct Candidate {
        string name;//Stores the candidate's name.
        uint voteCount;//Stores how many votes this candidate has.
    }

    Candidate[] public candidates;//Creates a dynamic array of Candidate structs.
    mapping(address => bool) public hasVoted;//

    constructor() {
        candidates.push(Candidate("Alice", 0));
        candidates.push(Candidate("Bob", 0));
        candidates.push(Candidate("Charlie", 0));
    }

    function vote(uint candidateId) public {//Creates a function called vote.
        require(!hasVoted[msg.sender], "Already voted");
        require(candidateId < candidates.length, "Invalid candidate");

        hasVoted[msg.sender] = true;
        candidates[candidateId].voteCount++;
    }

    function getWinner() public view returns(string memory winner) {
        uint highestVotes = 0;//Stores the largest vote count found so far.
        uint winnerIndex = 0;//Stores the position of the current winner.

        for(uint i = 0; i < candidates.length; i++) {//Checks every candidate one by one.
            if(candidates[i].voteCount > highestVotes) {
                highestVotes = candidates[i].voteCount;
                winnerIndex = i;
            }
        }

        return candidates[winnerIndex].name;
    }
}