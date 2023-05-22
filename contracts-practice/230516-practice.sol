// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract VISIBILITY {
    function privateF() private pure returns(string memory) {
        return "private";
    }

    function testPrivateF() public pure returns(string memory) {
        return privateF();
    }

    function testPrivateF2() internal pure returns(string memory) {
        return privateF();
    }

    function internalF() internal pure returns(string memory) {
        return "internal";
    }

    function testInternalF() public pure returns(string memory) {
        return internalF();
    }

    function externalF() external pure returns(string memory) {
        return "external";
    }

    function testPublicF() public pure returns(string memory) {
        return "public";
    }

    // function testExternalF() public pure returns(string memory) {
    //     return externalF();
    // }
}

contract Child is VISIBILITY {
    function testPrivateF_1() public pure returns(string memory) {
        return testPrivateF();
    }

    function testPrivateF_2() public pure returns(string memory) {
        return testPrivateF2();
    }

    function testInternal2() public pure returns(string memory) {
        return testInternalF();
    }



    // function testExternalF() public pure returns(string memory) {
    //     return externalF();
    // }
}

contract Outsider {
    VISIBILITY vs = new VISIBILITY();

    function getExternalFromVS() public view returns(string memory) {
        return vs.externalF();
    }

    function getPublicFromVS() public view returns(string memory) {
        return vs.testPublicF();
    }
}

// contract DAD {
//     uint a;

//     uint public wallet = 100;
//     uint internal crypto = 1000;
//     uint private emergency = 10000;

//     function who() virtual public pure returns(string memory) {
//         return "dad from DAD";
//     }

//     function name() internal pure returns(string memory) {
//         return "David";
//     }

//     function password() private pure returns(uint) {
//         return 1234;
//     }

//     function character() external pure returns(string memory) {
//         return "not good.";
//     }
// }

// contract MOM {
//     function who() virtual public pure returns(string memory) {
//         return "mom from MOM";
//     }

//     function getHusbandChar() public view returns(string memory) {
//         return super.character();
//     }
// }

// contract CHILD is DAD {
//     function who() override public pure returns(string memory) {
//         return super.who();
//     }

//     function fathersName() public pure returns(string memory) {
//         return super.name();
//     }

//     function password() public pure returns(uint) {
//         return super.password();
// }

// contract CHILD2 is DAD, MOM {
//     function who() override(DAD, MOM) public pure returns(string memory) {
//         return super.who();
//     }
// }

// contract CHILD2_2 is MOM, DAD {
//     function who() override(DAD, MOM) public pure returns(string memory) {
//         return super.who();
//     }
// }

// contract CHILD3 is DAD {
//     function who() override public pure returns(string memory) {
//         return "child from CHILD";
//     }

//     function dad(uint a) public pure returns(string memory, uint) {
//         return ("dad from CHILD", a);
//     }
// }

// contract DAD {
//     uint a;

//     uint public wallet=100;
//     uint internal crypto=1000; 
//     uint private emergency=10000;

//     function who() virtual public pure returns(string memory) {
//         return "dad from DAD";
//     }

//     function name() internal pure returns(string memory) {
//         return "David";
//     }

//     function password() private pure returns(uint) {
//         return 1234;
//     }

//     function character() external pure returns(string memory) {
//         return "not good";
//     }
// }

// contract MOM {
//     DAD husband = new DAD();

//     function who() virtual public pure returns(string memory) {
//         return "mom from MOM";
//     }

//     function getHusbandChar() public view returns(string memory) {
//         return husband.character();
//     }

//     function getHusbandWallet() public view returns(uint) {
//         return husband.wallet();
//     }

//     // function getHusbandCrypto() public view returns(uint) {
//     //     return husband.crypto();
//     // }
// }

// contract CHILD is DAD {
//     function fathersWallet() public view returns(uint) {
//         return DAD.wallet;
//     }

//     function fathersCrypto() public view returns(uint) {
//         return DAD.crypto;
//     }

//     // function fathersEme() public view returns(uint) {
//     //     return DAD.emergency;
//     // }

//     DAD daddy = new DAD();
//     DAD daddy2 = new DAD();
// }

contract DAD {
    function getAddress() public view returns(address) {
        return address(this);
    }
}

contract MOM {
    DAD husband = new DAD();

    function husbandAddress() public view returns(address) {
        return address(husband);
    }

    function husbandAddress2() public view returns(address) {
        return husband.getAddress();
    }
}

contract CHILD is DAD {
    function fatherAddress() public view returns(address) {
        return DAD.getAddress();
    }

    function fatherAddress2() public view returns(address) {
        return super.getAddress();
    }

    DAD daddy = new DAD();
    DAD daddy2 = new DAD();

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
}