// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract CONSTRUCTOR {
    uint a;
    uint b;

    constructor() {
        a = 7;
        b = 4;
    }

    function setA() public {
        a = 5;
    }

    function getA() public view returns(uint) {
        return a;
    }

    function getB() public view returns(uint) {
        return b;
    }
}

contract CONSTRUCTOR2 {
    uint a;

    constructor(uint _a) {
        a = _a;
    }
    
    function getA() public view returns(uint) {
        return a;
    }
}

contract CONSTRUCTOR3 {
    struct Student {
        string name;
        uint number;
    }

    Student s;

    constructor(string memory _name, uint _number) {
        s = Student(_name, _number);
    }

    function getStudent() public view returns(Student memory) {
        return s;
    }
}

contract CONSTRUCTOR4 {
    uint a;

    constructor(uint _a) {
        if (_a >= 5) {
            a = _a;
        } else {
            a = _a*2;
        }
    }

    function getA() public view returns(uint) {
        return a;
    }
}

contract CONSTRUCTOR5 {
    address payable owner;

    constructor() payable{
        payable(this).transfer(msg.value); // 배고할 때 msg.value만큼 contract에게 바로 입금
        owner = payable(msg.sender); // 배포하는 지갑주소가 바로 owner로 설정
    }

    function getOwner() public view returns(address) {
        return owner;
    }

    // contract가 _to에게 _amount만큼 보냄
    function transferTo(address payable _to, uint _amount) public {
        require(msg.sender == owner, "only owner can transfer asset.");
        _to.transfer(_amount);
    }

    receive() external payable{} // 일반 거래(별도의 호출되는 함수가 없을때)시 해당 contract가 돈을 받을 수 있게 해주는 함수

    // contract가 msg.value만큼 돈을 받는 함수
    function deposit() public payable returns(uint){
        return msg.value;
    }

    // contract가 owner에게 전액 돈을 보내는 함수, owner 입장에서는 전액 인출
    function withDraw() public {
        require(owner == msg.sender, "only owner can transfer asset.");
        owner.transfer(address(this).balance);
    }

    // contract가 owner에게 _amount만큼 돈을 보냄
    function withDraw2(uint _amount) public {
        require(owner == msg.sender, "only owner can transfer asset.");
        owner.transfer(_amount);
    }

    // contract가 owner에게 1 ether만큼 돈을 보냄
    function withDraw3() public {
        require(owner == msg.sender, "only owner can transfer asset.");
        owner.transfer(1 ether);
    }

}

contract MODIFIER {
    uint a;

    modifier lessThanFive() {
        require(a<5, "should be less than five");
        _; // 함수가 실행되는 시점
    }

    function aPlus() public {
        a++;
    }

    function aMinus() public {
        a--;
    }

    function getA() public view returns(uint) {
        return a;
    }

    function doubleA() public lessThanFive {
        a = a*2;
    }

    function plusTen() public lessThanFive {
        a += 10;
    }
}

contract MODIFIER2 {
    /*
    실습가이드
    1. setAasTwo()로 a 값 2로 만들기
    2. setA() 실행 후 결과 확인, getA()로 A 값 확인
    3. setAasTwo()로 a 값 다시 2로 만들기
    4. setA2() 실행 후 결과 확인, getA()로 A 값 확인
    */
    uint a;

    modifier plusOneBefore() {
        a++;
        _;
    }

    modifier plusOneAfter() {
        _;
        a++;
    }

    function setA() public plusOneBefore returns(string memory)  {
        if(a>=3) {
            return "A";
        } else {
            return "B";
        }
    }

    function setA2() public plusOneAfter returns(string memory)  {
        if(a>=3) {
            return "A";
        } else {
            return "B";
        }
    }

    function getA() public view returns(uint) {
        return a;
    }

    function setAasTwo() public {
        a = 2;
    }
}

contract MODIFIER3 {
    /*
    실습가이드
    1. setAasTwo()로 a 값 2로 만들기
    2. setA() 실행 후, getB2() 실행해서 결과 보기
    */
    uint a;
    string b;
    string[] b2;

    modifier plusOneBefore() {
        _;
        a++;
        _;
    }

    function setA() public plusOneBefore  {
        if(a>=3) {
            b = "A";
            b2.push(b);
        } else {
            b = "B";
            b2.push(b);
        }
    }

    function getA() public view returns(uint) {
        return a;
    }

    function getB() public view returns(string memory) {
        return b;
    }

    function getB2() public view returns(string[] memory) {
        return b2;
    }

    function setAasTwo() public {
        a = 2;
    }
}

contract MODIFIER4 {
    struct Person {
        uint age;
        string name;
    }

    Person P;

    modifier overTwenty(uint _age, string memory _criminal) {
        require(_age >20, "Too young");
        require(keccak256(abi.encodePacked(_criminal)) != keccak256(abi.encodePacked("Bob")), "Bob is criminal. She can't buy it");
        _;
    }

    function buyCigar(uint _a, string memory _name) public pure overTwenty(_a, _name) returns(string memory) {
        return "Passed";
    }

    function buyAlcho(uint _a, string memory _name) public pure overTwenty(_a, _name) returns(string memory) {
        return "Passed";
    }

    function buyGun(uint _a, string memory _name) public pure overTwenty(_a, _name) returns(string memory) {
        return "Passed";
    }

    function setP(uint _age, string memory _name) public {
        P = Person(_age, _name);
    }

    function getP() public view returns(Person memory) {
        return P;
    }

    function buyCigar2() public overTwenty(P.age, P.name) view returns(string memory) {
        return "Passed";
    }

    function buyAlcho2() public overTwenty(P.age, P.name) view returns(string memory) {
        return "Passed";
    }

    function buyGun2() public overTwenty(P.age, P.name) view returns(string memory) {
        return "Passed";
    }
}

contract MODIFIER5 {
    uint mutex = 0;

    modifier m_check {
        mutex++;
        _;
        mutex--;
    }

    modifier biggerThanTen {
        require(mutex>10, "should be bigger than 10.");
        _;
    }

    function cal() public view biggerThanTen returns(uint) {
        return mutex * 5;
    }

    function inAndOut() public m_check returns(string memory) {
        return "Done";
    }

    function plus() public {
        mutex++;
    }

    function ten() public {
        mutex--;
    }
}
