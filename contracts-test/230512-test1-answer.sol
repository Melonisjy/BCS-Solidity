// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract QUIZ2 {
    mapping (string => bytes32) ID_PW;

    // * 로그인 기능 - ID, PW를 넣으면 로그인 여부를 알려주는 기능
    function logIn(string memory _ID, string memory _PW) public view returns(bool) {
        return ID_PW[_ID] == keccak256(abi.encodePacked(_ID, _PW));
    }

    function logIn2(string memory _ID) public view returns(bytes32) {
        return ID_PW[_ID];
    }
    // * 회원가입 기능 - 새롭게 회원가입할 수 있는 기능
    function signIn(string memory _ID, string memory _PW) public {
        ID_PW[_ID] = keccak256(abi.encodePacked(_ID, _PW));
    }

    
}