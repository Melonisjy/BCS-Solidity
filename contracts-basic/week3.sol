// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract _21 {
    uint[] arr;

    function onlyThree(uint n) public {
        require (n % 3 == 0);
        arr.push(n);
    } 
}

contract _22 {
    function substract(uint a, uint b) public pure returns(uint) {
        if (a > b) {
            return a - b;
        } else {
            return b - a;
        }
    }
}

contract _23 {
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

contract _24 {
    function onlyAlice(string memory _name) public pure returns(bool) {
        return keccak256(bytes(_name)) == keccak256(bytes("Alice"));
    }
}

contract _25 {
    uint[] A;

    function autoPush(uint n) public {
        for (uint i=n+1; i>0; i--) {
            A.push(i-1);
        }
    }

    function autoPush2(uint n) public {
        while (n > 0) {
            A.push(n);
            n--;
        }
        A.push(0);
    }
}

contract _26 {
    uint[] odds;
    uint[] evens;

    function setArr(uint n) public {
        if (n % 2 == 0) {
            evens.push(n);
        } else {
            odds.push(n);
        }
    }
}

contract _27 {
    mapping (string => bytes32) ToBytes;

    function all(string memory _info) public {
        ToBytes[_info] = keccak256(abi.encodePacked(_info));
    }
}

contract _28 {
    function convert(string memory id, string memory pw) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(id, pw));
    }
}

contract _29 {

    uint a;
    string b;
    constructor(uint _a, string memory _b) {
        a = _a;
        b = _b;
    }
}