// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

/*
간단한 게임이 있습니다.
유저는 번호, 이름, 주소, 잔고, 점수를 포함한 구조체입니다. 
참가할 때 참가비용 1ETH를 내야합니다. (payable 함수)
4명까지만 들어올 수 있는 방이 있습니다. (array)
선착순 4명에게는 각각 4,3,2,1점의 점수를 부여하고 4명이 되는 순간 방이 비워져야 합니다.

예) 
간단한 게임이 있습니다.

참가할 때 참가비용 0.01ETH를 내야합니다.
4명까지만 들어올 수 있는 방이 있습니다.
선착순 4명에게는 각각 4,3,2,1점의 점수를 부여하고 4명이 되는 순간 방이 비워져야 합니다.

예) 
방 안 : "empty" 
-- A 입장 --
방 안 : A 
-- B, D 입장 --
방 안 : A , B , D 
-- F 입장 --
방 안 : A , B , D , F 
A : 4점, B : 3점 , D : 2점 , F : 1점 부여 후 
방 안 : "empty" 

유저는 10점 단위로 점수를 0.1ETH만큼 변환시킬 수 있습니다.
예) A : 12점 => A : 2점, 0.1ETH 수령 // B : 9점 => 1점 더 필요 // C : 25점 => 5점, 0.2ETH 수령

* 유저 등록 기능 - 유저는 이름만 등록, 번호는 자동적으로 순차 증가, 주소도 자동으로 설정, 점수도 0으로 시작
* 유저 조회 기능 - 유저의 전체정보 번호, 이름, 주소, 점수를 반환. 
* 게임 참가시 참가비 제출 기능 - 참가시 0.01eth 지불 (돈은 smart contract가 보관)
* 점수를 돈으로 바꾸는 기능 - 10점마다 0.1eth로 환전
* 관리자 인출 기능 - 관리자는 0번지갑으로 배포와 동시에 설정해주세요, 관리자는 원할 때 전액 혹은 일부 금액을 인출할 수 있음 (따로 구현)
---------------------------------------------------------------------------------------------------
* 예치 기능 - 게임할 때마다 참가비를 내지 말고 유저가 일정금액을 미리 예치하고 게임할 때마다 자동으로 차감시키는 기능.
*/


contract Q4 {
    struct User {
        uint number;
        string name;
        address account;
        uint balance;
        uint score;
    }

    mapping(address => User) userList;
    uint count;
    address payable owner;

    constructor() {
        owner = payable(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    User[] public top4; // 일단 dynamic

    // * 유저 등록 기능 - 유저는 이름만 등록, 번호는 자동적으로 순차 증가, 주소도 자동으로 설정, 점수도 0으로 시작
    function register(string memory _name) public {
        userList[msg.sender] = User(count++, _name, msg.sender, msg.sender.balance, 0);
    }

    // * 유저 조회 기능 - 유저의 전체정보 번호, 이름, 주소, 점수를 반환. 
    function search(address _a) public view returns(User memory) {
        return userList[_a];
    }

    // * 게임 참가시 참가비 제출 기능 - 참가시 0.01eth 지불 (돈은 smart contract가 보관)
    function gameIn() public payable {
        require((userList[msg.sender].balance >= 10**16 && msg.value==0) || msg.value == 0.01 ether);

        if(msg.value==0) {
            userList[msg.sender].balance -= 10**16;
        }

        if(top4.length == 4) {
            for(uint i=4;i>0;i--) {
                userList[top4[i-1].account].score += 5-i;
                // top4.pop(); -> 밑의 delete로 대체
            }
            delete top4; 
        }

        top4.push(userList[msg.sender]);
    }

    // * 점수를 돈으로 바꾸는 기능 - 10점마다 0.1eth로 환전
    function withdraw(uint _n) public {
        //10, 20, 30 <- 이렇게 넣을 때
        require(_n%10==0 && userList[msg.sender].score >= _n);
        /*1, 2, 3, 4 <- 이렇게 넣을 때
        require(userList[msg.sender].score >= _n*10);*/
        userList[msg.sender].score -= _n;
        payable(msg.sender).transfer(_n%10*0.1 ether);
    }

    // * 점수를 돈으로 바꾸는 기능 - 10점마다 0.1eth로 환전 (최대 금액 자동 환전)
    function withdraw_All() public {
        require(userList[msg.sender].score >= 10);
        uint a = userList[msg.sender].score /10;
        userList[msg.sender].score = userList[msg.sender].score%10;
        payable(msg.sender).transfer(a* 0.1 ether);
    }

    // * 관리자 인출 기능 - 관리자는 0번지갑으로 배포와 동시에 설정해주세요, 
    // 관리자는 원할 때 전액 혹은 일부 금액을 인출할 수 있음 (따로 구현)
    function ownerWithdraw(uint _n) public onlyOwner {
        owner.transfer(_n * 1 ether);
    }

    function ownerWithdrawAll() public onlyOwner {
        owner.transfer(address(this).balance);
    }

    // * 예치 기능 - 게임할 때마다 참가비를 내지 말고 유저가 일정금액을 미리 예치하고 게임할 때마다 자동으로 차감시키는 기능.
    function deposit() public payable {
        userList[msg.sender].balance += msg.value;
    }
}