// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract _41 {
    uint[4] public arr;

    uint count;

    function pushArr(uint _n) public {
        arr[count++] = _n;
    } 

    function initializeArr() public {
        delete arr;
    }

    function getArr() public view returns(uint[4] memory) {
        return arr;
    }
}

// 이름과 번호 그리고 지갑주소를 가진 '고객'이라는 구조체를 선언하세요. 
// 새로운 고객 정보를 만들 수 있는 함수도 구현하되 이름의 글자가 최소 5글자가 되게 설정하세요.
contract _42 {
    struct customer {
        string name;
        uint number;
        address account;
    }

    mapping (string => customer) nameToSearch;
    uint count;

    function setCustomer(string memory _name) public {
        require (bytes(_name).length > 4);
        nameToSearch[_name] = customer(_name, count++, msg.sender);
    }

    function getBytes(string memory _name) public pure returns(uint) {
        return bytes(_name).length;
    }
}

/*
1. 은행의 역할을 하는 contract를 만드려고 합니다. 별도의 고객 등록 과정은 없습니다. 
해당 contract에 ether를 예치할 수 있는 기능을 만드세요. 
또한, 자신이 현재 얼마를 예치했는지도 볼 수 있는 함수,
그리고 자신이 예치한만큼의 ether를 인출할 수 있는 기능을 구현하세요.
    힌트 : mapping을 꼭 이용하세요.
*/
contract _43 {
    mapping (address => uint) balance;
    function deposit() payable public {
        balance[msg.sender] += msg.value;
    }
    
    function getBalance() public view returns(uint) {
        return balance[msg.sender];
    }

    function withdraw() public {
        balance[msg.sender] -= getBalance();
        payable(msg.sender).transfer(address(this).balance);
    }
}

// string만 들어가는 array를 만들되, 4글자 이상인 문자열만 들어갈 수 있게 구현하세요.
contract _44 {
    string[] public arr;

    function pushArr(string memory _str) public {
        require (bytes(_str).length >= 4, "please check your length");
        arr.push(_str);
    }
}

// 숫자만 들어가는 array를 만들되, 100이하의 숫자만 들어갈 수 있게 구현하세요.
contract _45 {
    uint[] arr;

    function pushArr(uint _n) public {
        require (_n <= 100);
        arr.push(_n);
    }
}

/*
1. 3의 배수이거나 10의 배수이면서 50보다 작은 수만 들어갈 수 있는 array를 구현하세요.    
(예 : 15 -> 가능, 2의 배수 // 40 -> 가능, 10의 배수이면서 50보다 작음 // 66 -> 가능, 3의 배수 // 70 -> 불가능 10의 배수이지만 50보다 큼)
*/
contract _46 {
    uint[] arr;
    function pushArr(uint _n) public {
        require ((_n % 3 == 0) || (_n % 10 == 0 && _n < 50));
        arr.push(_n);
    }
}

// 배포와 함께 배포자가 owner로 설정되게 하세요. owner를 바꿀 수 있는 함수도 구현하되 그 함수는 owner만 실행할 수 있게 해주세요.
contract _47 {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    function changeOwner(address _addr) public {
        require (msg.sender == owner, "only owner can change the owner");
        owner = _addr;
    }
}

// A라는 contract에는 2개의 숫자를 더해주는 함수를 구현하세요. B라고 하는 contract를 따로 만든 후에 A의 더하기 함수를 사용하는 코드를 구현하세요.
contract _48_A {
    function add_A(uint a, uint b) public pure returns(uint) {
        return a + b;
    }
}

contract _48_B {
    function useAdd_A(address CA) public pure returns(uint) {
        _48_A useA = _48_A(CA);
        return useA.add_A(2, 3);
    }
}

// 긴 숫자를 넣었을 때, 마지막 3개의 숫자만 반환하는 함수를 구현하세요.
contract _49 {
    uint[3] public arr;

    // function get3nums(uint _n) public view returns(uint[3] memory) {
    //     arr[0] = 
    // }
}