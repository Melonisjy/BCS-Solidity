// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract REQUIRE {

    // 0x9c0257114eb9399a2985f8e75dad7600c5d89fe3824ffa99ec1c3eb8bf3b0501
    function Require1(uint _n) public pure returns(uint) {
        require(_n < 10, "Input should be lower than 10.");
        return _n*3;
    }

    function getName(string memory _name) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_name));
    } 

    function onlyAlice(string memory _name) public pure returns(bool) {
        require(getName(_name) == 0x9c0257114eb9399a2985f8e75dad7600c5d89fe3824ffa99ec1c3eb8bf3b0501);
        return true;
    }
}

contract REQUIRE2 {
    function getBool() public pure returns(bool) {
        bool _a;
        return _a;
    }

    function Require1() public pure returns(uint) {
        uint _a=1;
        bool b;
        require(b, "Error"); // 통과못함 bool 타입 변수의 초기값은 false이기 때문
        return _a;
    }

    function Require2() public pure returns(uint) {
        uint _a=1;
        bool b;
        return _a;
        require(b, "Error"); // Unrecheable code
    }

    uint a = 1;

    function getA() public view returns(uint) {
        return a;
    }

    function Require3() public {
        bool c;
        a = 5;
        require(c, "error"); // a를 5로 바꾼 것도 전부다 다시 revert (원래 상태로 복구) 시킴.
    }

    function Require3_2() public {
        bool c;
        a = 5;
        require(!c, "error"); 
    }

    function setAasFive() public {
        a =5;
    }

    // require 타 함수 호출
    function Require4() public {
        bool c;
        setAasFive(); // a의 값을 5로 설정하는 외부 함수
        require(c, "error"); // 외부함수도 모두 revert
    }

    // require 조건 2개
    function Require5(uint _n) public pure returns(bool) {
        require(_n%5==0 && _n>10, "Nope");
        return true;
    }

    // if문 안의 require
    function Require6(uint _a) public pure returns(uint) {
        if(_a%3==0) {
            require(_a%3!=0, "nope"); 
        } else if(_a%3==1) {
            return _a%3;
        } else {
            return _a%3;
        }
    }
}