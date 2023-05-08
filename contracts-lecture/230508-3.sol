// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract Struct {
    struct Student {
        string name;
        uint birthday;
        uint number;
    }

    Student[] students;

    function pushStudent(string memory _name, uint _birthday, uint _number) public {
        students.push(Student(_name, _birthday, _number));
    }

    function getStudent(uint _n) public view returns(Student memory) {
        return students[_n-1];
    }

    function getBirthday(uint _n) public view returns(uint) {
        return students[_n-1].birthday; // array이름[n번째].요소이름
    }
}