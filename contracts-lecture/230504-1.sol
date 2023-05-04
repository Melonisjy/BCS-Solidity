// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract UINTBYTES {
    uint a;
    uint8 b; // 8bits = 1 byte = 16진수 2자리 = 0 ~ ff(16진수) = 0 ~ 255(10진수)
    uint16 c;
    uint256 d;

    function setABCD(uint _a, uint8 _b, uint16 _c, uint256 _d) public {
        a = _a;
        b = _b;
        c = _c;
        d = _d;
    }

    function setABCD2(uint _a, uint8 _b, uint8 _c, uint8 _d) public {
        a = _a;
        b = _b;
        c = _c;
        d = _d;
    }

    /*
    function setABCD3(uint256 _a, uint256 _b, uint256 _c, uint256 _d) public {
        a = _a;
        b = _b; // uint8로 선언되었는데 들어오는 값은 더 큰 uint256
        c = _c; // uint16로 선언되었는데 들어오는 값은 더 큰 uint256
        d = _d;
    }
    */

    function getABCD() public view returns(uint, uint8, uint16, uint256) {
        return (a,b,c,d);
    }

    function getABCD2() public view returns(uint, uint, uint, uint) {
        return (a,b,c,d);
    }

    /*
    function getABCD2() public view returns(uint8, uint8, uint8, uint8) {
        return (a,b,c,d);
        a, d // 준비한 것은 uint256인데, 내보내는 값은 uint8 밖에 안됨 -> 준비한 값의 일부 날라감
    }
    */
}