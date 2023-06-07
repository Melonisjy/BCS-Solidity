// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// 숫자들이 들어가는 배열을 선언하고 그 중에서 3번째로 큰 수를 반환하세요.
contract _51 {
    uint[] public nums = [1,5,7,2,3,9];

    function sorting() public  {
        for (uint i = 0; i < nums.length-1; i++) {
            for (uint j = i+1; j < nums.length; j++) {
                if (nums[i] < nums[j]) {
                    (nums[i], nums[j]) = (nums[j], nums[i]);
                }
            }
        }
    }

    function topThree() public view returns(uint) {
        return nums[2];
    }
}

// 자동으로 아이디를 만들어주는 함수를 구현하세요. 이름, 생일, 지갑주소를 기반으로 만든 해시값의 첫 10바이트를 추출하여 아이디로 만드시오.
contract _52 {
    function createId(string memory name, uint birth) public view returns(bytes10) {
        return bytes10(keccak256(abi.encodePacked(name, birth, msg.sender)));
    }
}

/* 1. 시중에는 A,B,C,D,E 5개의 은행이 있습니다. 각 은행에 고객들은 마음대로 입금하고 인출할 수 있습니다. 각 은행에 예치된 금액 확인, 입금과 인출할 수 있는 기능을 구현하세요.   
    힌트 : 이중 mapping을 꼭 이용하세요. */

contract _53 {
    mapping (string => mapping (address => uint)) balance;

    // 입금 기능
    function deposit(string memory _bank, uint _amount) payable public {
        balance[_bank][msg.sender] = _amount * 10**18;
    }

    // 인출 기능
    function withdraw(string memory _bank, uint _amount) public {
        require (balance[_bank][msg.sender] >= _amount * 10**18);
        balance[_bank][msg.sender] -= _amount * 10**18;
        payable(msg.sender).transfer(_amount * 10**18);
    }

    // 예치금 확인 기능
    function check(string memory _bank) public view returns(uint) {
        return balance[_bank][msg.sender];
    }
}

/* 1. 기부받는 플랫폼을 만드세요. 가장 많이 기부하는 사람을 나타내는 변수와 그 변수를 지속적으로 바꿔주는 함수를 만드세요.
    힌트 : 굳이 mapping을 만들 필요는 없습니다. */

contract _54 {
    address VIP;
    uint donated_amount;

    function donate() public payable {
        if (msg.value > donated_amount) {
            VIP = msg.sender;
            donated_amount = msg.value;
        }
    }
}

/* 배포와 함께 owner를 설정하고 owner를 다른 주소로 바꾸는 것은 오직 owner 스스로만 할 수 있게 하십시오. */
contract _55 {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    function changeOwner(address _addr) public {
        require (owner == msg.sender);
        owner = _addr;
    }
}

/* 위 문제의 확장버전입니다. owner와 sub_owner를 설정하고 owner를 바꾸기 위해서는 둘의 동의가 모두 필요하게 구현하세요. */
contract _56 {
    address owner;
    address sub_owner;

    constructor(address _sub) {
        owner = msg.sender;
        sub_owner = _sub;
    } 

    bool isOwnerAgree;
    bool isSubOwnerAgree;

    function ownerAgree() public {
        isOwnerAgree = true;
    }

    function subOwnerAgree() public {
        isSubOwnerAgree = true;
    }

    function changeOwner(address new_owner) public {
        require (isOwnerAgree && isSubOwnerAgree == true);
        owner = new_owner;
    }
}

contract _56_Answer {
    address owner;
    address sub_owner;

    constructor(address _sub) {
        owner = msg.sender;
        sub_owner = _sub;
    }

    uint8[2] agreed;

    modifier bothAgreed() {
        require (agreed[0] * agreed[1] == 1);
        _;
    }

    function changeOwner(address newOwner) public {
        owner = newOwner;
    }

    function agree_Owner(bool _agree) public {
        require (msg.sender == owner);
        if (_agree == true) {
            agreed[0] = 1;
        } else {
            agreed[0] = 0;
        }
    }

    function agree_SubOwner(bool _agree) public {
        require (msg.sender == sub_owner);
        if (_agree == true) {
            agreed[1] = 1;
        } else {
            agreed[1] = 0;
        }
    }
}

// 위 문제의 또다른 버전입니다. owner가 변경할 때는 바로 변경가능하게 sub-owner가 변경하려고 한다면 owner의 동의가 필요하게 구현하세요.
contract _57 {
    
}