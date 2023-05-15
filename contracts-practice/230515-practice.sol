// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract CONSTRUCTOR {
    address payable owner;

    constructor() payable {
        payable(this).transfer(msg.value);
        owner = payable(msg.sender);
    }

    function getOwner() public view returns(address) {
        return owner;
    } 

    function transferTo(address payable _to, uint _amount) public {
        require(owner == msg.sender, "only owner can transfer");
        _to.transfer(_amount);
    }

    receive() external payable{}

    function deposit() public payable returns(uint) {
        return msg.value;
    }

    // contract가 owner에게 전액 돈을 보내는 함수, owner 입장에서는 전액 인출
    function withdraw() public {
        require(msg.sender == owner);
        owner.transfer(address(this).balance);
    }

    // contract가 owner에게 _amount만큼 보내는 함수
    function withdraw2(uint _amount) public {
        require(msg.sender == owner);
        owner.transfer(_amount);
    }
}

contract MODIFIER {
    struct Person {
        uint age;
        string name;
    }

    Person p;

    modifier overTwenty(uint _age, string memory _criminal) {
        require (_age >= 20, "not adult.");
        require (keccak256(abi.encodePacked(_criminal)) != keccak256(abi.encodePacked("Bob")), "you are criminal!!");
        _;
    }

    function getCigar(uint _age, string memory _name) public pure overTwenty(_age, _name) returns(string memory) {
        return "passed.";
    }
}