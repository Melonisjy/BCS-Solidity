// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

/* 숫자형 변수 number, 문자형 변수 name, bytes2형 변수 password 그리고 memeber라는 구조체를 선언하세요.
member형 변수 Michael을 선언하세요.
Michael에 값을 부여하는 setM 함수를 구현하세요.
member형 변수들이 들어가는 members를 선언하세요.
members에 새로운 member 변수를 넣는 pushMember 함수를 구현하세요 */

contract note {
    struct member {
        uint number;
        string name;
        bytes2 password;
    }

    member Michael;

    function setM(uint _number, string memory _name, bytes2 _password) public {
        Michael = member(_number, _name, _password);
    }

    member[] members;

    function pushMember(uint _number, string memory _name, bytes2 _password) public {
        members.push(member(_number, _name, _password));
    }
}