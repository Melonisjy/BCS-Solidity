// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract a {
    uint public num;

    function changeNum(uint _num) public {
        num = _num;
    }
}

contract b {
    a A;

    constructor (address _address) {
        A = a(_address);
    }

    function changeNum(uint _num) public {
        A.changeNum(_num);
    } 
}