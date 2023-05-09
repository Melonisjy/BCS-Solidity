// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;


contract ForLoop {
    function forLoop() public pure returns(uint){
        uint a;

        for(uint i=1; i<6; i++ /*시작점; 끝점; 변화방식*/) {
            a = a+i; // a+=i
        }

        return a;
    }

    function forLoop2() public pure returns(uint, uint){
        uint a;
        uint i;

        for(i=1; i<6; i++ /*시작점; 끝점; 변화방식*/) {
            a = a+i;
        }

        return (a,i);
    }

    function forLoop3() public pure returns(uint, uint) {
        uint a;
        uint i;

        for (i=1; i<=5; i++) {
            a += i;
        }

        return (a, i);
    }

    uint[4] c;
    uint count;

    function pushA(uint _n) public {
        c[count++] = _n;
    }

    function getA() public view returns(uint[4] memory) {
        return c;
    }

    function forLoop4() public view returns(uint) {
        uint a;
        for (uint i=0; i<4; i++) {
            a = a + c[i];
        }

        return a;
    }

    function forLoop5() public view returns(uint) {
        uint a;
        for (uint i=0; i<c.length; i++) {
            a += c[i];
        }

        return a;
    }

    uint[] d;
    function pushD(uint _n) public {
        d.push(_n);
    }

    function getD() public view returns(uint[] memory) {
        return d;
    }

    function forLoop6() public view returns(uint) {
        uint a;
        for (uint i=0; i<d.length; i++) {
            a += d[i];
        }

        return a;
    }
}

contract fixedArray {
    /*
    실습 가이드
    0. getALength(), getA(), getBLength(), getB() 결과 확인하기
    1. 1 -> pushA, 2 -> pushA, 3,4 진행
    2. getA(), getALength() 해보기
    3. 1 -> pushB2, 3-> pushB2, 5,7, 진행
    4. getB(), getBLength() 해보기

    ----------------------
    초기화 한 후,
    0. getBLength(), getB() 해보기
    1. 1 -> pushB2() 한 후에, getBLength(), getB() 해보기
    2. 초기화 후, 1 -> pushB3() 한 후에, getBLength(), getB() 해보기
    3. 1번 결과 2번 결과 비교해보기
    */

    uint[] a;
    uint[4] b;

    function getALength() public view returns(uint) {
        return a.length;
    }

    function pushA(uint _n) public {
        a.push(_n);
    }

    function getA() public view returns(uint[] memory) {
        return a;
    }

    function getBLength() public view returns(uint) {
        return b.length;
    }

    function pushB(uint n, uint _n) public {
        b[n] = _n;
    }

    function getB() public view returns(uint[4] memory) {
        return b;
    }

    uint count;
    
    function pushB2(uint _n) public {
        b[count++] = _n;
    }

    function pushB3(uint _n) public {
        b[++count] = _n;
    }

    function getCount() public view returns(uint) {
        return count;
    }
}