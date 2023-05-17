// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract A {

    uint public a;
    uint public b;
    uint public c;
    uint public d;

    function setABCD(uint _a, uint _b, uint _c, uint _d) public {
        (a,b,c,d) = (_a, _b, _c, _d); 
    }

    function ABC() public view returns(string memory) {
        require(a ==0 && b != 1 || c ==0);
        /*
        a=0 b=2 c=2 <- 앞의 조건 2개 만족, 뒤의 조건 불만족 -> o
        a=0 b=1 c=0 <- 앞의 조건 1개 만족, 뒤의 조건 만족 -> o
        a=0 b=1 c=1 <- 앞의 조건 1개 만족, 뒤의 조건 불만족 -> x
        a=1 b=1 c=0 <- 앞의 조건 0개 만족, 뒤의 조건 만족 -> o
        a=1 b=1 c=1 <- 모두 불만족 -> x
        */
        return "aaa";
    }

    function ABC2() public view returns(string memory) {
        require(a ==0 || b != 1 && c ==0);
        /*
        (a // b,c)
        (a,b // c)
        (a,c // b)
        a=0, b=1, c=1 <- a만 만족 -> o
        a=1, b=2, c=1 <- b만 만족 -> x
        a=1, b=1, c=0 <- c만 만족 -> x
        a=0, b=2, c=1 <- a,b 만족 -> o
        a=0, b=1, c=0 <- a,c 만족 -> o 
        a=1, b=2, c=0 <- b,c 만족 -> o
        */
        return "aaa";
        /*
        0,0,0, -> o
        */
    }

    function ABCD() public view returns(string memory) {
        require(a ==0 || b != 1 && c ==0 || d==0);
        /*
        a=0, b=1, c=1, d=1 <- a만 만족 -> o
        a=1, b=0, c=1, d=1 <- b만 만족 -> x
        a=1, b=1, c=0, d=1 <- c만 만족 -> x
        a=1, b=1, c=1, d=0 <- d만 만족 -> o 
        a=0, b=0, c=1, d=1 <- a,b만 만족 -> o
        a=0, b=1, c=0, d=1 <- a,c만 만족 -> o
        a=0, b=1, c=1, d=0 <- a,d만 만족 -> o
        a=1, b=0, c=0, d=1 <- b,c만 만족 -> o
        a=1, b=0, c=1, d=0 <- b,d만 만족 -> o
        a=1, b=1, c=0, d=0 <- c,d만 만족 -> o
        a=0, b=0, c=0, d=1 <- a,b,c만 만족 -> 
        a=0, b=0, c=1, d=0 <- a,b,d만 만족 -> o
        a=0, b=1, c=0, d=0 <- a,c,d만 만족 -> o
        a=1, b=0, c=0, d=0 <- b,c,d만 만족 -> o
        */

        return "aaa";
    }
}

contract B {
    function deposit() public payable {}

    uint eth = 1 ether;

    function transferTo(address payable _to, uint _amount) public {
        _to.transfer(_amount * eth);
    }
}

contract C1 {
    function deposit() public payable {}
    receive() external payable{}
}

contract C2 {
    function deposit() public payable {}
    
}