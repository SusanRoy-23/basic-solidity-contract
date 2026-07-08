//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;
contract DataTypesExample{
    //integer type
    uint public age= 21; //unsigned integer only positive cannot store negative values
    int public temperature= -19; //signed integer stores both positive and negative numbers.

    //Boolean
    bool public isStudent=true; //used in conditions like checking if a user is verified or whether a process is complete

    //Address
    address public owner; //stores an ethereum wallet or contract address

    //String
    string public name= "Susan"; //stores text

    //Bytes
    bytes32 public course="Blockchain"; //fixed size(32) used for IDs, Hashes

    //Enum
    enum Status { Pending, Active, Completed } //allows only predefined values
    Status public currentStatus;

    //Struct
    struct Student{
        string name;
        uint marks;
    }
    Student public student;

    //Array
    uint[] public marks;

    //Mapping
    mapping(address => uint)
    public balance;

    //Constructor
    constructor(){
        owner=msg.sender;
        currentStatus = Status.Pending;
    }
    //Update Student Details
    function setStudent(string memory _name, uint _marks) public 
    { 
        student=Student(_name,_marks);
    }
    //Add Marks
    function addMarks(uint _mark)
    public {
        marks.push(_mark);
    }
    //Deposit Balance
    function deposit(uint amount)
    public{
        balance[msg.sender] +=amount;
    }
    //Change Status
    function changeStatus(Status _status) public{
        currentStatus= _status;
    }
    //Read Array Length
    function getMarksCount()
    public view returns(uint){
        return marks.length;
    }

}