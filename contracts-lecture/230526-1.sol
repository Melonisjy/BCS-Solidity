// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract STUDENT {
    mapping(string => address) public walletList;

    function putMyWallet(string calldata _name, address _addr) public {
        walletList[_name] = _addr;
    }

    function showMyWallet(string calldata _name) public view returns(address) {
        return walletList[_name];
    }
}