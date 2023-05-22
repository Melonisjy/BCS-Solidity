// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract A {
    uint public a;
    uint public b;
    uint public c;

    function setABCD(uint _a, uint _b, uint _c) public {
        (a, b, c) = (_a, _b, _c);
    }

    function ABC() public view returns(string memory) {
        require(a == 0 && b != 1 || c == 0);
        return "pass";
    }

    function ABC2() public view returns(string memory) {
        require(a == 0 || b != 1 && c == 0);
        return "pass";
    }
}

contract B {
    function deposit() public payable {}

    uint eth = 1 ether;

    function transferTo(address payable _to, uint amount) public {
        _to.transfer(amount * eth);
    }
}

contract C1 {
    function deposit() public payable{}
    receive() external payable{}
}

contract C2 {
    function deposit() public payable{}
}