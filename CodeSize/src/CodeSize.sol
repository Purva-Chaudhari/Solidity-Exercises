// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract CodeSize {
    /**
     * The challenge is to create a contract whose runtime code (bytecode) size is greater than 1kb but less than 4kb
     */
     struct Student {
        uint256 id;
        string name;
        uint8 grade;
     }

    Student private student;
    function setStudent (uint256 _id, string memory _name, uint8 _grade) external {
        student = Student(_id, _name, _grade);
     }

    function getId (uint256 _id) public view returns (string memory) {
        require(_id == student.id);
        return student.name;
    }
}
