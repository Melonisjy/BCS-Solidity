// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract _31 {
    function isAorB(string memory _name) public pure returns(bool) {
        return (keccak256(abi.encodePacked(_name)) == keccak256(abi.encodePacked("Alice")) || keccak256(abi.encodePacked(_name)) == keccak256(abi.encodePacked("Bob")));
    }
}

contract _32 {
    uint[] arr;
    function getArray(uint _n) public {
        require (_n % 3 == 0 && _n % 10 != 0);
        arr.push(_n);
    }
}

contract _33 {
    struct Member {
        string name;
        uint number;
        address account;
        uint birth;
    }

    mapping (string => Member) nameSearch;

    function setMember(string memory _name, uint _number, uint _birth) public {
        nameSearch[_name] = Member(_name, _number, msg.sender, _birth);
    }
    
    function getMemberByName(string memory _name) public view returns(Member memory) {
        return nameSearch[_name];
    } 
}

contract _34 {
    struct student {
        string name;
        uint number;
        uint score;
    }

    student[] students;

    function getAvg() public view returns(uint) {
        uint total;
        for (uint i=0; i<students.length; i++) {
            total += students[i].score;
        }
        return total / students.length;
    }
}

contract _35 {
		uint[] numbers;

		function pushNumbers(uint[] memory _numbers) public returns(uint[] memory) {
			for(uint i=0; i<1+_numbers.length/2;i+=2) {
				numbers.push(_numbers[i+1]);
			}
			return numbers;
		}

        function getNumber() public view returns(uint[] memory) {
            return numbers;
        }
}

contract _36 {
    enum Status {
        high,
        neutral,
        low
    }

    function returnStatus(uint a) public pure returns(Status) {
        if (a >= 7) {
            return Status.high;
        } else if (a >= 4) {
            return Status.neutral;
        } else {
            return Status.low;
        }
    }
}

contract _37 {
    address payable public owner;

    constructor () {
        owner = payable(msg.sender);
    }

    function donateWei() public payable {
        require (msg.value == 1 wei);
    }

    function donateFinney() public payable {
        require (msg.value == 1000000000000000 wei);
    }

    function donateEther() public payable {
        require (msg.value == 1 ether);
    }

    function getAmount() public onlyOwner{
        owner.transfer(address(this).balance);
    }

    modifier onlyOwner() {
        require (msg.sender == owner);
        _;
    }
}

contract _38 {
    address payable public owner;

    string a = "A";

    constructor() {
        owner = payable(msg.sender);
    }   

    modifier onlyOwner() {
        require (msg.sender == owner, "only owner");
        _;
    }

    function changeToB() public onlyOwner {
        a = "B";
    }

    function changeToC() public onlyOwner {
        a = "C";
    }

    function getA() public view returns(string memory) {
        return a;
    }
}

contract _39 {
    function returnNumbers(uint _n) public pure returns (uint, uint, uint, uint) {
        return (_n/2, _n/3, _n/5, _n/7);
    }
}

contract _40 {
    function sorting(uint[] memory _numbers) public pure returns(uint[] memory, uint[] memory) {
        uint[] memory centrals;
        uint[] memory arrays;

        for (uint i=0; i<_numbers.length-1; i++) {
            for (uint j=i+1; j<_numbers.length; j++) {
                if (_numbers[i] > _numbers[j]) {
                    (_numbers[i], _numbers[j]) = (_numbers[j], _numbers[i]);
                }
            }
        }
        
        arrays = _numbers;
        
        if (arrays.length % 2 == 0) {
            centrals[0] = arrays[(arrays.length / 2) - 1];
            centrals[1] = arrays[arrays.length / 2];
            return (centrals, arrays);
        } else {
            centrals[0] = arrays[arrays.length / 2];
            return (centrals, arrays);
        }
    }
}