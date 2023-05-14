// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

// sorting practice
contract Sorting {
    uint[] numbers;

    function pushNumber(uint _n) public {
        numbers.push(_n);
    }

    function sorting() public { // ascending sorting
        for (uint i=0; i<numbers.length-1; i++) {
            for (uint j=i+1; j<numbers.length; j++) {
                if (numbers[i] < numbers[j]) {
                    (numbers[i], numbers[j]) = (numbers[j], numbers[i]);
                }
            }
        }
    }

    function sorting2() public {
        for (uint i=0; i<numbers.length-1; i++) {
            for (uint j=i+1; j<numbers.length; j++) {
                if (numbers[i] > numbers[j]) {
                    (numbers[i], numbers[j]) = (numbers[j], numbers[i]);
                }
            }
        }
    }

    function getNumbers() public view returns(uint[] memory) {
        return numbers;
    }
}