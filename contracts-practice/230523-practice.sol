// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract practice {
    function concat1(string memory _a, string memory _b) public pure returns(string memory) {
        return string.concat(_a, _b);
    }

    function concat2(string memory _a, string memory _b) public pure returns(string memory) {
        return string(abi.encodePacked(_a,_b));
    }

    function concat3(string memory _a, string memory _b) public pure returns(string memory) {
        return string.concat(_a, ":", _b);
    }

    /*function concat4(uint a, uint b) public pure returns(uint) {
        return uint.concat(a, b);
    }*/
}