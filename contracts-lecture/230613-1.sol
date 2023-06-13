// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.18;

contract A {
    function a() public view returns(address) {
        return msg.sender;
    }

    function b() public view returns(address) {
        return address(this);
    }

    function c() public view returns(address) {
        return tx.origin;
    }
}

contract B {
    A c_a;

    constructor(address _addr) {
        c_a = A(_addr);
    }

    function a() public view returns(address) {
        return c_a.a(); // B 컨트랙트 주소
    }

    function b() public view returns(address) {
        return c_a.b(); // A 컨트랙트의 주소
    }

    function c() public view returns(address) {
        return c_a.c(); // 0번 지갑 주소    
    }
}