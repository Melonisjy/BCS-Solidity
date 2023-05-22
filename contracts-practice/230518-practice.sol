// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract POPvsDELETE {
    uint[] public a;

    function pushA(uint _n) public {
        a.push(_n);
    }

    function getA() public view returns(uint[] memory) {
        return a;
    }

    function popA() public {
        a.pop();
    }

    function deleteA() public {
        delete a;
    }

    function renewA() public {
        a = new uint[](3);
    }
}

contract REVERSEARRAY {
    function reverse1(uint[] calldata _n) public pure returns(uint[] memory) {
        uint[] memory _reverse = new uint[](_n.length);
        for (uint i=0; i<_n.length; i++) {
            _reverse[i] = _n[_n.length-i-1];
        }
        return _reverse;
    }

    function reverse2(uint[] memory _n) public pure returns(uint[] memory) {
        for (uint i=0; i<_n.length/2; i++) {
            (_n[i], _n[_n.length-i-1]) = (_n[_n.length-i-1], _n[i]);
        }
        return _n;
    }
}