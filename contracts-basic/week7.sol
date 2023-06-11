// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// a의 b승을 반환하는 함수를 구현하세요.
contract _61 {
    function returnNum(uint a, uint b) public pure returns(uint) {
        return a ** b;
    }
}

// 2개의 숫자를 더하는 함수, 곱하는 함수 a의 b승을 반환하는 함수를 구현하는데 3개의 함수 모두 2개의 input값이 10을 넘지 않아야 하는 조건을 최대한 효율적으로 구현하세요.
contract _62 {
    modifier lessThanTen(uint a, uint b) {
        require (a < 10 && b < 10);
        _;
    }

    function addNum(uint a, uint b) public lessThanTen(a, b) pure returns(uint) {
        return a + b;
    }

    function mulNum(uint a, uint b) public lessThanTen(a, b) pure returns(uint) {
        return a * b;
    }

    function powerNum(uint a, uint b) public lessThanTen(a, b) pure returns(uint) {
        return a ** b;
    }
}

// 2개 숫자의 차를 나타내는 함수를 구현하세요.
contract _63 {
    function sub(uint a, uint b) public pure returns(uint) {
        return a - b;
    }
}

// 지갑 주소를 넣으면 5개의 4bytes로 분할하여 반환해주는 함수를 구현하세요.
contract _64 {
    
}
