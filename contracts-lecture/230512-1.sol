// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

/*
0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2

1000000000000000000
*/

contract note {
    address payable owner;
    address a;

    function deposit() public payable returns(uint) {
        return msg.value;
    } // 함수를 실행을 시켜야 호출됨.
    receive() external payable {} // 받는지갑이 contract면 실행됨.
    fallback() external payable {} // 함수호출이 없는 함수호출이면 실행됨.

    function setOwner() public {
        owner = payable(msg.sender);
    }

    function getOwner() public view returns(address){
        return owner;
    }

    function setA() public {
        a = payable(msg.sender);
    }

    function getA() public view returns(address) {
        return a;
    }

    function transferTo(address payable _to, uint _amount) public {
        _to.transfer(_amount);
    }

    function transferToOwner(uint _amount) public {
        owner.transfer(_amount);
    }

    /*function tranferToA(uint _amount) public {
        a.transfer(_amount);
    }*/
}
