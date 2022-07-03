// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Indexed {
    event index_1(uint indexed _num, string _name);

    function event_1(uint _n, string memory _s) public {
        emit index_1(_n, _s);
    }
}