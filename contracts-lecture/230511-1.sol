// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

// mapping 복습
contract Mapping {
    mapping (uint => uint) a;
    mapping (string => uint) b;
    
    struct Wallet {
        string name;
        uint number;
        address account;
    }

    mapping (string => Wallet) c;
    Wallet[] wallets;

    function setWallet(string memory _name, uint _number, address _account) public {
        wallets.push(Wallet(_name, _number, _account));
    }

    function getWallet(uint _n) public view returns(Wallet memory) {
        return wallets[_n-1];
    }

    function getAddress(uint _n) public view returns(address) {
        return wallets[_n-1].account;
    }

    function getAll() public view returns(Wallet[] memory) {
        return wallets;
    }
}

contract fixedArray {
    uint[10] a;
    uint[] b;

    uint count;
    
    function setA(uint _n) public {
        a[count++] = _n;
    }

    function changeA(uint n, uint _n) public {
        a[n-1] = _n;
    }

    function setB(uint _n) public {
        b.push(_n);
    }

    function changeB(uint n, uint _n) public {
        b[n-1] = _n;
    }

    function sumA() public view returns(uint) {

        uint sum;

        for (uint i=0; i<a.length; i++) {
            sum += a[i];
        }
        
        return sum;
    }
}