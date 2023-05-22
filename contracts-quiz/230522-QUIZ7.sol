/*
숫자를 시분초로 변환하세요.
예) 100 -> 1분 40초, 600 -> 10분, 1000 -> 16분 40초, 5250 -> 1시간 27분 30초
*/

// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract QUIZ7 {
    function conversion(uint _time) public pure returns(uint, uint, uint) {
        uint hour;
        uint minute;
        uint second;

        if (_time < 60) {
            hour = 0;
            minute = 0;
            second = _time;
        } else if (_time < 3600) {
            hour = 0;
            minute = _time / 60;
            second = _time % 60;
        } else {
            hour = _time / 3600;
            minute = (_time - (3600 * hour)) / 60;
            second = (_time - (3600 * hour)) % 60;
        }
        return (hour, minute, second);
    }
}