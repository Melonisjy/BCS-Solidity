/*
실습가이드
1. DAD 2번 배포
2. MOM 배포 (1번째 DAD의 주소를 넣어서 배포)
3. 2번 배포된 DAD에서 각각 다르게 변수 변화 주기
4. MOM에서 setDad 함수를 통해 잔액 변화 추적
*/

// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract DAD {
    uint a;
    address public b;

    uint public wallet=100; // 공개한 지갑 잔액
    uint internal crypto=1000; // 메모장에 private key가 있는 크립토 잔액
    uint private emergency=10000; // 진짜 비상금

    function password() private pure returns(uint) {
        return 1234;
    }

    function changeWallet(uint _n) public {
        wallet = _n;
    }

    function getAddress() public returns(address) {
        b = address(this);
    }

}

contract MOM {
    DAD husband = new DAD();
    DAD realHusband;

    constructor(address _a) {
        realHusband = DAD(_a);
    }

    function getWallet() public view returns(uint) {
        return husband.wallet();
    }

    function getRealWallet() public view returns(uint) {
        return realHusband.wallet();
    }

    function trackWallet(address _a) public view returns(uint) {
        DAD copyDad = DAD(_a);
        return copyDad.wallet();
    }
}

contract CHILD is DAD {
    // DAD realDaddy;

    // constructor(address _a) {
    //     realDaddy = DAD(_a);
    // }

    // function dadChangeWallet(uint _a) public {
    //     realDaddy.changeWallet(_a);
    // }

    function getFatherAddress() public view returns(address) {
        return DAD.address;
    }
}