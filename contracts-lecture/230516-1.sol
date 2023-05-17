// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract Dad {
    function add(uint a, uint b) public pure returns(uint) {
        return a+b;
    }
}

contract Mom {
    function sub(uint a, uint b) public pure returns(uint) {
        return a-b;
    }
}

contract Child is Dad {
    function mul(uint a, uint b) public pure returns(uint) {
        return a*b;
    }

    function mul2(uint a, uint b) virtual public pure returns(uint) {
        return a*b*2;
    }

    function addDoubleTime(uint a, uint b) public pure returns(uint) {
        return Dad.add(a,b)*2;
    }
}

contract Child2 is Dad, Mom {
    function mul(uint a, uint b) public pure returns(uint) {
        return a*b;
    }
}

contract GrandChild is Child {
    function div(uint a, uint b) public pure returns(uint) {
        return a/b;
    }
}

contract GrandChild2 is Child {
    function mul2(uint a, uint b) override public pure returns(uint) {
        return a*a*b;
    }
}


contract DAD {
    uint a;

    uint public wallet=100; // 공개한 지갑 잔액
    uint internal crypto=1000; // 메모장에 private key가 있는 크립토 잔액
    uint private emergency=10000; // 진짜 비상금

    function who() virtual public pure returns(string memory) {
        return "dad from DAD";
    }

    function name() internal pure returns(string memory) {
        return "David";
    }

    function password() private pure returns(uint) {
        return 1234;
    }

    function character() external pure returns(string memory) {
        return "not good";
    }

    function getAddress() public view returns(address) {
        return address(this);
    }

    function getMsgSender() public view returns(address) {
        return msg.sender;
    }

    function changeWallet(uint _n) public {
        wallet = _n;
    }
}

contract MOM {
    DAD husband = new DAD();
    DAD realHusband;

    constructor(address _a) {
        realHusband = DAD(_a);
    }

    function getWallet() public view returns(uint) {
        return husband.wallet();
    }

    function getRealWallet() public view returns(uint) {
        return realHusband.wallet();
    }

    function changeRealWallet(uint _a) public {
        realHusband.changeWallet(_a);
    }

    function trackWallet(address _a) public view returns(uint) {
        DAD copyDad = DAD(_a);
        return copyDad.wallet();
    }

    function who() virtual public pure returns(string memory) {
        return "mom from MOM";
    }

    function getHusbandChar() public view returns(string memory) {
        return husband.character();
    }

    // function getWallet() public view returns(uint) {
    //     return husband.wallet();
    // }

    function husbandAddress() public view returns(address) {
        return address(husband);
    }

    function husbandAddress2() public view returns(address) {
        return husband.getAddress();
    }

    function husGetMsgSender() public view returns(address) {
        return husband.getMsgSender();
    }

    /*
    Visibility에서 차단
    function getCrypto() public view returns(uint) {
        return husband.crypto();
    }

    function getEmergency() public view returns(uint) {
        return husband.emergency();
    }
    */
}

contract CHILD is DAD {
    function who() override public pure returns(string memory) {
        return super.who();
        // return "child from CHILD";
    }

    function fathersName() public pure returns(string memory) {
        return super.name();
    }

    function fathersWallet() public view returns(uint) {
        return DAD.wallet;
    }

    function fathersCrypto() public view returns(uint) {
        return DAD.crypto;
    }

    function fathersAddress() public view returns(address) {
        return DAD.getAddress();
    }

    function fathersAddress2() public view returns(address) {
        return super.getAddress();
    }

    function dadGetMsgSender() public view returns(address) {
        return super.getMsgSender();
    }

    DAD daddy = new DAD();
    DAD daddy2 = new DAD();

    function daddyGetMsgSender() public view returns(address) {
        return daddy.getMsgSender();
    }

    function daddyGetMsgSender2() public view returns(address) {
        return daddy2.getMsgSender();
    }

    /*function fathersName2() public pure returns(string memory) {
        return daddy.name();
    }*/

    function fathersWallet2() public view returns(uint) {
        return daddy.wallet();
    }

    /*function fathersCrypto2() public view returns(uint) {
        return daddy.crypto();
    }*/

    function getDaddyAddress() public view returns(address) {
        return address(daddy);
    }

    function getDaddyAddress2() public view returns(address) {
        return daddy.getAddress();
    }

    function getDaddy2Address() public view returns(address) {
        return address(daddy2);
    }

    function getDaddy2Address2() public view returns(address) {
        return daddy2.getAddress();
    }

    /*
    Visibility - private 막힘
    function fathersEmergency() public view returns(uint) {
        return DAD.emergency;
    }
    */

    /*
    오류 발생 상속받은 아이는 external 접근 불가능
    function fathersChar() public pure returns(string memory) {
        return super.character();
    }
    */

    /*
    오류 발생 password는 private 함수
    function password_Dad() public pure returns(uint) {
        return super.password();
    }
    */
}