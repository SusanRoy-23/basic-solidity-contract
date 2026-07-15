// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TodoList {

    struct Task {
        string work;//Stores the task description.
        bool completed;//Stores whether the task is completed.
    }

    mapping(uint => Task) public tasks;

    uint public taskCount;//Keeps track of how many tasks exist.

    event TaskAdded(uint id, string work);//Whenever a task is added,the blockchain records
    event TaskCompleted(uint id);//Whenever a task is completed,the blockchain records

    function addTask(string memory _work) public { //
        taskCount++;

        tasks[taskCount] = Task(_work, false);

        emit TaskAdded(taskCount, _work);
    }

    function completeTask(uint _id) public {
        require(_id > 0 && _id <= taskCount, "Task does not exist");

        tasks[_id].completed = true;

        emit TaskCompleted(_id);
    }

    function getTask(uint _id) public view returns(string memory, bool) {
        return (tasks[_id].work, tasks[_id].completed);
    }
}