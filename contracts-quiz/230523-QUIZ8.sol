// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/*
로또 프로그램을 만드려고 합니다. 숫자와 문자는 각각 4개 2개를 뽑습니다. 6개가 맞으면 1이더, 5개의 숫자가 순서와 함께 맞으면 0.75이더, 4개가 맞으면 0.25이더, 3개가 맞으면 0.1이더 2개 이하는 상금이 없습니다. 

참가 금액은 0.05이더이다.

기준 숫자 : 1,2,3,4,A,B
-----------------------------------------------------------------

- 기준 숫자 설정 기능 : 5개의 사람이 임의적으로 4개의 숫자와 2개의 문자를 넣음. 5명이 넣은 숫자들의 중앙값과 알파벳 순으로 따졌을 때 가장 가운데 문자로 설정

예) 숫자들의 중앙값 : 1,3,6,8,9 -> 6 // 2,3,4,8,9 -> 4
예) 문자들의 중앙값 : a,b,e,h,l -> e // a,h,i,q,z -> i
*/

// 참가금액은 0.05 이더 이므로 한번 드로우하면 컨트랙트에 0.05이더가 쌓이는데 상금은 최소 0.1이더로 컨트랙트에서 보낼 수 없다.
// 따라서 다른 지갑주소에서 줘야할것 같은데....

contract Q8 {
    uint[] lottoNum; // 입력받을 로또 숫자 4개
    string[] lottoStr; // 입력받을 로또 문자 2개

    uint[] realLottoNum = [1, 2, 3, 4]; // 기준 숫자
    string[] realLottoStr = ["a", "b"]; // 기준 문자

    uint public count; // 맞은 개수

    function drawLotto(uint a, uint b, uint c, uint d, string memory x, string memory y) payable public {
        lottoNum = [a, b, c, d];
        lottoStr = [x, y];
        require (msg.value == 0.05 ether);
        for (uint i=0; i<4; i++) {
            for (uint j=0; j<4; j++) {
                if (lottoNum[i] == realLottoNum[j]) {
                    count += 1;
                }
            }
        }

        for (uint i=0; i<2; i++) {
            for (uint j=0; j<2; j++) {
                if (keccak256(abi.encodePacked(lottoStr[i])) == keccak256(abi.encodePacked(realLottoStr[j]))) {
                    count += 1;
                }
            }
        }
        if (count == 6) {
            payable(msg.sender).transfer(1 ether);
        } else if (count == 5) {
            payable(msg.sender).transfer(0.75 ether);
        } else if (count == 4) {
            payable(msg.sender).transfer(0.25 ether);
        } else if (count == 3) {
            payable(msg.sender).transfer(0.1 ether);
        }
    }    
}





























// contract Q8 {
//     string[6] myLotto;
//     uint[] answer;

//     constructor() { // 기준 숫자 설정
//         answer = [1,2,3,4];
//         answer.push(uint(keccak256(bytes("a"))));
//         answer.push(uint(keccak256(bytes("b"))));
//     }
       

//     function draw(string memory _a, string memory _b, string memory _c, string memory _d, string memory _e, string memory _f) public payable {
//         require (msg.value == 0.05 ether); // 50000000 gwei
//     }

//     function setLotto(string memory _a, string memory _b, string memory _c, string memory _d, string memory _e, string memory _f) public {
//         myLotto = [_a, _b, _c, _d, _e, _f];
//     }
// }