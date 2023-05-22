// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract _11 {
    uint[] arr;

    function onlyEven(uint n) public {
        require (n % 2 == 0);
        arr.push(n);
    }
}

contract _12 {
    function threeAdd(uint a, uint b, uint c) public pure returns(uint) {
        return a+b+c;
    }

    function threeMul(uint a, uint b, uint c) public pure returns(uint) {
        return a*b*c;
    }

    function three(uint a, uint b, uint c) public pure returns(uint) {
        return a*b+c;
    }
}

contract _13 {
    function getABC(uint n) public pure returns(string memory) {
        if (n % 3 == 0) {
            return "A";
        } else if (n % 3 == 1) {
            return "B";
        } else {
            return "C";
        }
    }
}

contract _14 {
    struct student {
        uint number;
        string name;
        string[] classes;
    }

    student[] students;

    function setStudent(string memory _name, string[] memory _classes) public {
        students.push(student(students.length+1, _name, _classes));
    }
}

contract _15 {
    uint[] arr;
    function autoPush(uint n) public {
        for (uint i=0; i<n+1; i++) {
            arr.push(i);
        }
    }
}

contract _16 {
    uint[] arr;

    function pushArr(uint _n) public {
        arr.push(_n);
    }

    function sumArr() public view returns(uint) {
        uint count;
        for (uint i=0; i<arr.length; i++) {
            count += arr[i];
        }
        return count;
    }
}

contract _17 {
    function onlyBob(string memory _name) public pure returns(bool) {
        return (keccak256(bytes(_name)) == keccak256(bytes("Bob")));
    }
}

contract _18 {
    mapping (string => uint) searchBirth;

    function setBirth(string memory _name, uint _birth) public {
        searchBirth[_name] = _birth;
    }

    function getBirth(string memory _name) public view returns(uint) {
        return searchBirth[_name];
    }
}

contract _19 {
    function double(uint n) public pure returns(uint) {
        require (n < 1000);
        return n * 2;
    }
}

contract _20 {
    uint[] arr;

    function pushArr(uint _n) public {
        for (uint i=0; i<15; i++) {
            arr.push(_n);
        }

        for (uint i=3; i<15; i+=3) {
            delete arr[i-1];
        }
    }
}