// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract APP {
    mapping (address => uint) balance; // 개인 잔액
    // mapping (address => mapping (address => uint)) bankAccounts

    // 입금하기
    function depositToApp() public payable {
        balance[msg.sender] -= msg.value;
    }



}

contract BANK {
    mapping (address => uint) private balance;

    // 입금 - 얼만큼의 돈을 입금하겠다.
    function depositToBank() public payable {
        balance[msg.sender] += msg.value;
    }

    // 입금 - 특정 주소로 얼만큼의 돈을 입금하겠다.
    function Deposit(address _address, uint _amount) public {
        require (_amount != 0, "Amount should not be zero.");
        balance[_address] += _amount;
    }

    // 인출 - 얼만큼의 돈을 출금하겠다.
    function withdraw(uint _amount) public {
        balance[msg.sender] -= _amount;
        
    }
}