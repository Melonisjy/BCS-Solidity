// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract test {
    uint public a;

    function getCA() public view returns (address) {
        return address(this);
    }

    function changeA(uint _a) public {
        a = _a;
    }

    function three(uint _a, uint _b, uint _c) public pure returns(uint) {
        return _a * _b * _c;
    }
}