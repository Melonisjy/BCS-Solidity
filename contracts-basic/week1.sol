// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract Calculator {
    function add(uint _a, uint _b) public pure returns(uint) {
        return (_a+_b);
    } 
    
    function substract(uint _a, uint _b) public pure returns(uint) {
        return (_a-_b);
    }
    
    function multiply(uint _a, uint _b) public pure returns(uint) {
        return (_a*_b);
    }

    function divide(uint _a, uint _b) public pure returns(uint) {
        return (_a/_b);
    }

    function square(uint _n) public pure returns(uint) {
        return (_n**2);
    }

    function cubic(uint _n) public pure returns(uint) {
        return (_n**3);
    }
}

contract Struct {
    struct student {
        string name;
        uint number;
        string[] classes;
    }

    student[] students;
}

contract IF {

    function calculator2(uint _n) public pure returns(uint) {
        if (_n == 1 || _n == 2 || _n == 3) {
            return _n**2;
        } else if (_n == 4 || _n == 5 || _n == 6) {
            return _n * 2;
        } else if (_n == 7 || _n == 8 || _n == 9) {
            return (_n%3);
        } else {
            return 0;
        }
    }
}

contract ForLoop {
    uint[] numbers;

    function pushNum() public {
        for (uint i=0; i<10; i++) {
            numbers.push(i);
        }
    }
}

contract ForLoop2 {
    uint[] numbers;

    function For1() public {
        for (uint i=0; i<6; i++) {
            numbers.push(i);
        }
    }

    function getSum() public view returns(uint) {
        uint count;
        for (uint i=0; i<numbers.length; i++) {
            count += numbers[i];
        }
        return count;
    }
}

contract ABC {
    function getABC(uint _n) public pure returns(string memory) {
        if (_n >= 1 && _n <= 10) {
            return "A";
        } else if (_n >= 11 && _n <=20) {
            return "B";
        } else if (_n >= 21 && _n <=30) {
            return "C";
        } else {
            return "invalid num";
        }
    }
}

contract stringToByte {
    function change(string memory _str) public pure returns(bytes memory) {
        return bytes(_str);
    }
}

contract last {
    uint[] numbers;

    function pushNum(uint _n) public {
        numbers.push(_n);
    }

    function popNum() public {
        numbers.pop();
    }

    function getAll() public view returns(uint[] memory) {
        return numbers;
    }

    function getN(uint _n) public view returns(uint) {
        return numbers[_n-1];
    }
}
