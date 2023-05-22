// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract QUIZ4 {

    // 유저는 번호, 이름, 주소, 잔고, 점수를 포함한 구조체입니다.
    struct User {
        uint number;
        string name;
        address payable Address;
        uint balance;
        uint score;
    }

    User[] users;
    address payable user_address;
    address owner;
    uint num;

    // 관리자는 0번지갑으로 배포와 동시에 설정해주세요.
    constructor() {
        require (msg.sender == 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, "only owner can deploy.");
        owner = msg.sender;
    }

    // 이름으로 구조체 매핑
    mapping (string => User) User_Name;

    // 4명까지만 들어올 수 있는 방이 있습니다. (array)
    string[4] room;

    // 참가할 때 참가비용 1ETH를 내야합니다. (payable 함수)
    function join() public payable returns(uint) {
        require (msg.value == 1 ether, "please transfer 1 ether.");
        return msg.value;
    }

    // 유저 등록 기능 - 유저는 이름만 등록, 번호는 자동적으로 순차 증가, 주소도 자동으로 설정, 점수도 0으로 시작
    function register(string memory _name) public {
        user_address = payable(msg.sender);
        users.push(User(users.length+1, _name, user_address, 0, 0));
        User_Name[_name] = User(users.length, _name, user_address, 0, 0);
    }

    // 유저 조회 기능 - 유저의 전체정보 번호, 이름, 주소, 점수를 반환.
    function getUser() public view returns(User[] memory) {
        return users;
    }

    function getRoom() public view returns(string[4] memory) {
        return room;
    }

    // 게임 참가시 참가비 제출 기능 - 참가시 0.01eth 지불 (돈은 smart contract가 보관)
    function joinToGame(string memory _name) public payable {
        require (msg.value == 10000000000000000 wei, "please transfer 0.01 ether.");
        room[num++] = _name;
        User_Name[_name].score += 1;
    }

    // 방 안에 4명이 다 찼을 시에 비워주는 함수
    function emptyRoom() public view returns{
        if ()
    }

    // 점수를 돈으로 바꾸는 기능 - 10점마다 0.1eth로 환전
    function exchange(string memory _name) public {
        require (User_Name[_name].score >= 10, "please check your score.");
        (User_Name[_name].Address).transfer(100000000000000000 wei);
        User_Name[_name].score -= 10;
    }

    // 관리자는 원할 때 전액 인출 가능
    // 관리자는 원할 때 일부 금액 인출 가능
}