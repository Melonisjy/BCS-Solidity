// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract QUIZ2 {
    struct User {
        bytes32 hash;
        uint attempts;
    }

    mapping (string => User) ID_PW;

    function getHash(string memory _ID, string memory _PW) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_ID, _PW));
    }

    function userInfo(string memory _ID) public view returns(string memory, User memory) {
        return (_ID, ID_PW[_ID]);
    }

    // * 로그인 기능 - ID, PW를 넣으면 로그인 여부를 알려주는 기능
    function logIn(string memory _ID, string memory _PW) public returns(bool) {
        // * 비밀번호 5회 이상 오류시 경고 메세지 기능 - 비밀번호 시도 회수가 5회되면 경고 메세지 반환
        require(ID_PW[_ID].attempts < 5, "Too much attempts.");
        if (ID_PW[_ID].hash == getHash(_ID, _PW)) {
            ID_PW[_ID].attempts = 0;
            return true;
        } else {
            ID_PW[_ID].attempts++;
            return false;
        }
    }

    function logIn2(string memory _ID) public view returns(bytes32) {
        return ID_PW[_ID].hash;
    }
    // * 회원가입 기능 - 새롭게 회원가입할 수 있는 기능
    function signIn(string memory _ID, string memory _PW) public {
        
        // * 회원가입시 이미 존재한 아이디 체크 여부 기능 - 이미 있는 아이디라면 회원가입 중지
        //require(ID_PW[_ID].hash == "", "Provided ID is already being used.");
        require(ID_PW[_ID].hash == 0x0000000000000000000000000000000000000000000000000000000000000000, "Provided ID is already being used.");
        ID_PW[_ID].hash = getHash(_ID, _PW);
    }

    // * 회원탈퇴 기능 - 회원이 자신의 ID와 PW를 넣고 회원탈퇴 기능을 실행하면 관련 정보 삭제 
    function signOut(string memory _ID, string memory _PW) public {
        //require(ID_PW[_ID] == keccak256(abi.encodePacked(_ID, _PW)));
        require(ID_PW[_ID].hash == getHash(_ID, _PW));
        delete ID_PW[_ID];
    }    
}