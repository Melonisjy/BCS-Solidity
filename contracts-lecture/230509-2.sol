// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract note {
    mapping (uint => uint) a;
    mapping (string => uint) b;
    mapping (bytes => uint) c;

    function setB(string memory _key, uint _value) public {
        b[_key] = _value;
    }

    function getB(string memory _key) public view returns(uint) {
        return b[_key];
    }

    function setC(bytes memory _key, uint _value) public {
        c[_key] = _value;
    }

    function getC(bytes memory _key) public view returns(uint) {
        return c[_key];
    }

    struct Student {
        uint number;
        string name;
        string[] classes;
    }

    mapping (string => Student) Teacher_Student;

    function setTeacher_Student(string memory _Teacher, uint _number, string memory _name, string[] memory _classes) public {
        Teacher_Student[_Teacher] = Student(_number, _name, _classes);
    }

    function getTeacher_Student(string memory _Teacher) public view returns(Student memory) {
        return Teacher_Student[_Teacher];
    }
}