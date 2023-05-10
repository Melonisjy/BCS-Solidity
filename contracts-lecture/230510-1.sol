// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

// 어제 복습

contract note{
    struct Student {
        string name;
        uint number;
        string[] classes;
    }

    Student[] students;

    function setStudents(string memory _name, uint _number, string[] memory _classes) public {
        students.push(Student(_name, _number, _classes));
    }

    function getStudents(uint _n) public view returns(Student memory) {
        return students[_n-1];
    }

    function getName(uint _n) public view returns(string memory) {
        return students[_n-1].name;
    }

    mapping (string => Student[]) Teacher_Student;

    function setStudent(string memory _Teacher, string memory _name, uint _number, string[] memory _classes) public {
        Teacher_Student[_Teacher].push(Student(_name, _number, _classes));
    }

    function setStudent2(string memory _aa, uint _n, uint _number) public {
        Teacher_Student[_aa][_n-1].number = _number;
    }

    function getStudent(string memory _Teacher) public view returns(Student[] memory) {
        return Teacher_Student[_Teacher];
    }
}