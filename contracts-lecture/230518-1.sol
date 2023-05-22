// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract POPvsDELETE {
    uint[] public a;

    function pushA(uint _n) public {
        a.push(_n);
    }

    function returnA() public view returns(uint[] memory) {
        return a;
    }

    function popA() public {
        a.pop(); //41551, 26531, 10267 / 41551, 26531, 10267 / 41551, 26531, 10267 / 47071, 25065, 10267
    } //41576, 26553, 10289 / 41576, 26553, 10289 / 41576, 26553, 10289 / 41576, 26553, 10289 / 

    /*
    pop과 delete 비교
    array를 초기화 시키기 위해서 delete는 한번만 수행, pop은 여러번 수행해야하는 차이가 있음.
    pop은 같은 양의 cost를 요구하지만 맨 마지막 번에는 추가적인 gas를 요구함

    delete는 단일 수행이므로 요구하는 gas가 높으나, 총액으로 환산하면 더 경제적임.
    */

    function deleteA() public {
        delete a; // 81202, 37288, 25546
    } // 81227, 37306, 25568

    // 81253, 37324, 25590 (4) , 149266, 61597, 55932(10)
    /*
    delete와 renew 비교
    delete와 renew 모두 내부 요소의 개수가 커질수록 cost도 늘어남.
    4개의 경우 그리고 10개의 경우 모두 delete가 gas, transaction, execution cost 모두 낮음.
    uint[]의 경우에는 delete가 renew 보다 (현 상황으로는) 효과적으로 보임.
    */
    function renewA() public {
        a = new uint[](0);
    } // 81358, 37397, 25682 (4) , 149372, 61671, 56024(10)
}

contract REVERSEARRAY {
    function reverse(uint[] calldata numbers) public pure returns(uint[] memory) {
        uint[] memory _reverse = new uint[](numbers.length);
        for(uint i=0; i<numbers.length; i++) {
            _reverse[i] = numbers[numbers.length-i-1];
        }
        return _reverse;
    }

    function reverse2(uint[] memory numbers) public pure returns(uint[] memory) {
        for(uint i=0; i<numbers.length/2; i++) {
            (numbers[i], numbers[numbers.length-1-i]) = (numbers[numbers.length-1-i], numbers[i]);
        }
        return numbers;
    }
}

contract BYTES_LENGTH {
    function getLength1(bytes1 a) public pure returns(uint) {
        return a.length;
    }

    function getLength2(bytes2 a) public pure returns(uint) {
        return a.length;
    }

    function getLength3(bytes3 a) public pure returns(uint) {
        return a.length;
    }

    function getLength(bytes memory a) public pure returns(uint) {
        return a.length;
    }

    function bytes1ToString(bytes1 a) public pure returns(string memory) {
        string memory _a = string(abi.encodePacked(a));
        return _a;
    }
}