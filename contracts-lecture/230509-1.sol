// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract note {
    struct Student {
        string name;
        uint birth;
        uint number;
    }

    Student[] students;

    function pushStudent(string memory _name, uint _birth, uint _number) public {
        students.push(Student(_name, _birth, _number));
    }

    function getStudent(uint _n) public view returns(Student memory) {
        return students[_n-1];
    }

    function getName(uint _n) public view returns(string memory) {
        return students[_n-1].name;
    }
}

contract note2 {
    struct D {
        string a;
        uint b;
        bytes2 c;
    }

    D ddd;

    function setDDD(string memory _a, uint _b, bytes2 _c) public {
        ddd = D(_a, _b, _c);
    }

    D[] D_list;

    function getAllList() public view returns(D[] memory) {
        return D_list;
    }

    function getList(uint _n) public view returns(D memory) {
        return D_list[_n-1];
    }

    function pushD(string memory _a, uint _b, bytes2 _c) public {
        D_list.push(D(_a,_b,_c));
    }
}

contract note3 {
    struct ABC {
        uint a;
        string b;
        string[] c;
    }

    ABC[] ABCs;

    function pushABC(uint _a, string memory _b, string[] memory _c) public {
        ABCs.push(ABC(_a, _b, _c));
    }

    function getABC(uint _n) public view returns(ABC memory) {
        return ABCs[_n-1];
    }

    function getAll() public view returns(ABC[] memory) {
        return ABCs;
    }

    function getC(uint _n) public view returns(string[] memory) {
        return ABCs[_n-1].c;
    }



}