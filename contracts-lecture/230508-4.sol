// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract Address {
    address a;

    function getAddress() public view returns(address) {
        return address(this);
    }

    function getMyAddress() public view returns(address) {
        return address(msg.sender);
    }

    function getMyBalance() public view returns(uint) {
        return address(msg.sender).balance;
    }

    function getContractBalance() public view returns(uint) {
        return address(this).balance;
    }

    function setA(address _a) public {
        a = _a;
    }

    function setA2(bytes20 _a) public {
        a = address(_a);
    }

    function getA2() public view returns(bytes20) {
        return bytes20(a);
    }

    function getA() public view returns(address) {
        return a;
    }

    /* uint b;

    // 상태변수가 바뀌었기 때문에 가스비 소비
    function changeB() public {
        b = b + 5;
    }

    function add(uint _a, uint _b) public pure returns(uint) {
        return _a + _b;
    } */
}

contract Mapping {
    mapping(uint => uint) a;
    mapping(uint => string) b; // mapping(type => type) mapping name
    mapping(string => address) c;

    mapping(uint => mapping(string => uint)) score;

    // 이름을 검색하면 그 아이의 키를 반환하는 contract를 구현하고 싶다.
    mapping(string => uint) height;

    // 정보 넣기
    function setHeight(string memory _name, uint _h) public {
        height[_name] = _h; // mapping이름[key 값] = value 값
    }

    // 정보 받기
    function getHeight(string memory _name) public view returns(uint) {
        return height[_name];
    }
}
