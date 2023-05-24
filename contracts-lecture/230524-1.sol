// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract note {
    function add(uint _a, uint _b, uint _c, uint _d) public pure returns(uint) {
        return (_a + _b + _c + _d);
    }
    
    uint public a;
    function change(uint _n) public {
        a = _n;
    }
}

contract note1 {
    note public Note;

    constructor(address numberAddress) {
        Note = note(numberAddress);
    }

    function change(uint _n) public {
        Note.change(_n);
    }
    
}