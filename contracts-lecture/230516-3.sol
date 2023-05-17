// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract A {
    uint public a;
    uint public b;
    constructor(uint _a, uint _b) {
        a = _a;
        b = _b;
    }
}

contract B {
    A a = new A(1, 2);
    A b;

    constructor(uint _a, uint _b) {
        b = new A(_a, _b);
    }
}

contract C is A(3, 4) {
    

}