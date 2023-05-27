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