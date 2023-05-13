// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract test{
    /*
    struct member {
        string id;
        bytes32 password;
    }
    

    member[] members;
    */

    mapping (string => bytes32) toPwd;
    mapping (bytes32 => string) toId;

    // 로그인 기능
    function login(string memory _id, string memory _password) public view returns(bool) {
        if (toPwd[_id] == keccak256(bytes(_password))) {
            return true;
        } else {
            return false;
        }
    }

    // 회원가입 기능
    function signUp(string memory _id, string memory _password) public view returns(bool) {
        // 아이디 중복 체크
        /*
        if (_id == toId[keccak256(bytes(_password))]) {
            return false;
        } else if (toPwd[_id] == keccak256(bytes(_password))) {
            return true;
        }
        */
        
    }

    /*
    function getMember() public view returns(member[] memory){
        return members;
    }
    

    function withdrawal(string memory _id, string memory _password) public {

    }
    */

}