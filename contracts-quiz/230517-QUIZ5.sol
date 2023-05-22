// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract QUIZ5 {
    // 숫자를 넣었을 때 그 숫자의 자릿수와 각 자릿수의 숫자를 나열한 결과를 반환하세요.
    function setNumber(uint _n) public pure returns(uint, uint[] memory) {
        uint count;
    }
    
    // 문자열을 넣었을 때 그 문자열의 자릿수와 문자열을 한 글자씩 분리한 결과를 반환하세요.
    function setString(string memory _str) public pure returns(uint) {
        bytes memory strToBytes = bytes(_str);
        uint length = strToBytes.length;
        
        return length;
    }
}