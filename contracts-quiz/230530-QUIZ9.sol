// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/*
흔히들 비밀번호 만들 때 대소문자 숫자가 각각 1개씩은 포함되어 있어야 한다 등의 조건이 붙는 경우가 있습니다. 그러한 조건을 구현하세요.

입력값을 받으면 그 입력값 안에 대문자, 소문자 그리고 숫자가 최소한 1개씩은 포함되어 있는지 여부를 알려주는 함수를 구현하세요.
시간은 9시 35분까지 제출은 9시 30분부터입니다.
*/

contract QUIZ9 {
    function setPW(string memory _pw) public pure returns(bool) {
        bool isUpperCase;
        bool isLowerCase;
        bool isNumber;

        for (uint i=0; i < bytes(_pw).length; i++) {
            bytes1 bytes_pw = bytes(_pw)[i];

            if (uint8(bytes_pw) <= 39 && uint8(bytes_pw) >= 30) {
                isNumber = true;
            } else if (uint8(bytes_pw) <= 122 && uint8(bytes_pw) >= 97) {
                isLowerCase = true;
            } else if (uint8(bytes_pw) <= 90 && uint8(bytes_pw) >= 65) {
                isUpperCase = true;
            }
        }
        if (isUpperCase && isNumber && isLowerCase) {
            return true;
        } else {
            return false;
        }

    }
}