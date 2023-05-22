/*
숫자를 넣었을 때 그 숫자의 자릿수와 각 자릿수의 숫자를 나열한 결과를 반환하세요.
예) 2 -> 1,   2 // 45 -> 2,   4,5 // 539 -> 3,   5,3,9 // 28712 -> 5,   2,8,7,1,2
--------------------------------------------------------------------------------------------
문자열을 넣었을 때 그 문자열의 자릿수와 문자열을 한 글자씩 분리한 결과를 반환하세요.
예) abde -> 4,   a,b,d,e // fkeadf -> 6,   f,k,e,a,d,f
*/

// 밑의 0518 - array reverse와 같이 참고

// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract Q5 {

    function divideNumber(uint _n) public pure returns(uint, uint[] memory) {
        uint[] memory b = new uint[](getLength(_n));

        uint i=getLength(_n);
        while(_n !=0) {
            b[--i] = _n%10;
            _n = _n/10;
        }
        return (b.length , b);
    }

    function getLength(uint _n) public pure returns(uint) {
        uint a;
        while(_n > 10**a) {
            a++;
        }
        return a;
    }

    function bytestoBytes1Array(bytes memory _bytes) public pure returns(bytes1[] memory) {
        bytes1[] memory _bytes1 = new bytes1[](_bytes.length);
        for(uint i=0; i<_bytes1.length; i++) {
            _bytes1[i] = _bytes[i];
        }
        return _bytes1;
    }

    function stringToBytes1Array(string memory _string) public pure returns(uint, string[] memory, string memory) {
        bytes1[] memory b_array = new bytes1[](bytes(_string).length);
        b_array = bytestoBytes1Array(bytes(_string));
        
        string[] memory s_array = new string[](b_array.length);

        for(uint i=0; i<s_array.length; i++) {
            s_array[i] = string(abi.encodePacked(b_array[i]));
        }

        return (s_array.length, s_array, string(abi.encodePacked(b_array)));
    }
}