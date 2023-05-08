// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract note1 {
    struct D {
        uint a;
        string b;
        bytes2 c;
    }

    D dd;

    function setDD(uint _a, string memory _b, bytes2 _c) public {
        dd = D(_a, _b, _c);
    }

    function getDD() public view returns(D memory) {
        return dd;
    }

    D[] Ds;

    function pushD(uint _a, string memory _b, bytes2 _c) public {
        Ds.push(D(_a, _b, _c));
    }

    function pushD2() public {
        Ds.push(dd);
    }

    function getLength() public view returns(uint) {
        return Ds.length;
    }

    function getN(uint _n) public view returns(D memory) {
        return Ds[_n-1];
    }

    function getA(uint _n) public view returns(uint) {
        return Ds[_n-1].a;
    }
}

contract note2 {
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

    function getA() public view returns(address) {
        return a;
    }

    function getA2() public view returns(bytes20) {
        return bytes20(a);
    }
}

contract note3 {
    mapping(uint => uint) a;
    mapping(uint => string) b; // mapping(type => type) mapping name
    mapping(string => address) c;

    // 이름을 검색하면 그 아이의 키를 반환하는 contract를 구현하고 싶다.
    mapping (string => uint) height;

    // 정보 넣기
    function setHeight(string memory _name, uint _height) public {
        height[_name] = _height;
    }

    // 정보 받기
    function getHeight(string memory _name) public view returns(uint) {
        return height[_name];
    }
}