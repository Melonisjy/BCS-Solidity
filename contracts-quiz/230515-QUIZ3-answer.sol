// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

/*
자동차를 운전하려고 합니다.
자동차의 상태에는 정지, 운전중, 시동 끔, 연료없음 총 4가지 상태가 있습니다.

정지는 속도가 0인 상태, 운전 중은 속도가 있는 상태이다. 

* 악셀 기능 - 속도를 1 올리는 기능, 악셀 기능을 이용할 때마다 연료가 2씩 줄어듬, 연료가 30이하면 더 이상 악셀을 이용할 수 없음, 70이상이면 악셀 기능은 더이상 못씀
* 브레이크 기능 - 속도를 1 줄이는 기능, 브레이크 기능을 이용할 때마다 연료가 1씩 줄어듬, 속도가 0이면 브레이크는 더이상 못씀
* 시동 끄기 기능 - 시동을 끄는 기능, 속도가 0이 아니면 시동은 꺼질 수 없음
* 시동 켜기 기능 - 시동을 켜는 기능, 시동을 키면 정지 상태로 설정됨
* 주유 기능 - 주유하는 기능, 주유를 하면 1eth를 지불해야하고 연료는 100이 됨

지불은 smart contract에게 함.
----------------------------------------------------------------------------------------
* 주유소 사장님은 2번 지갑의 소유자임, 주유소 사장님이 withdraw하는 기능
* 지불을 미리 하고 주유시 차감하는 기능
*/


contract Q3 {
    //자동차의 상태에는 정지, 운전중, 시동 끔, 연료없음 총 4가지 상태가 있습니다.
    enum carStatus {
        stop,
        driving,
        turnedOff,
        outOfFuel
    }

    struct car {
        carStatus status;
        uint fuelGauage;
        uint speed;
    }

    car public myCar;
    address payable public owner;

    constructor(/*필요하면 input값을 받아서 실행해야함*/) {
        owner = payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
        // owner = payable(msg.sender) -> 2번지갑으로 배포해야함
    }

    // * 악셀 기능 - 속도를 1 올리는 기능, 악셀 기능을 이용할 때마다 연료가 2씩 줄어듬, 연료가 30이하면 더 이상 악셀을 이용할 수 없음, 70이상이면 악셀 기능은 더이상 못씀
    function accel() public {
        require(myCar.fuelGauage >30 && myCar.speed < 70 && myCar.status != carStatus.turnedOff);
        if(myCar.status != carStatus.driving) {
            myCar.status = carStatus.driving;
        }
        myCar.speed++;
        myCar.fuelGauage -= 2;
    }

    // * 브레이크 기능 - 속도를 1 줄이는 기능, 브레이크 기능을 이용할 때마다 연료가 1씩 줄어듬, 속도가 0이면 브레이크는 더이상 못씀
    function breakCar() public {
        require(/*myCar.speed !=0 &&*/ myCar.status != carStatus.turnedOff && myCar.status != carStatus.stop);
        myCar.speed--;
        myCar.fuelGauage --;

        if(myCar.speed == 0) {
            myCar.status = carStatus.stop;
        }

        if(myCar.fuelGauage == 0) {
            myCar.status = carStatus.outOfFuel;
        }
    }

    // * 시동 끄기 기능 - 시동을 끄는 기능, 속도가 0이 아니면 시동은 꺼질 수 없음
    function turnOff() public {
        require(myCar.speed ==0 && myCar.status != carStatus.turnedOff || myCar.fuelGauage ==0); /*a || b&c || d&e || f*/
        if(myCar.speed !=0) {
            myCar.speed =0; //fuelGauage가 0인 상태라면 speed가 0이 아닌 상황이 있을 수 있음
        }

        myCar.status = carStatus.turnedOff;
    }

    // * 시동 켜기 기능 - 시동을 켜는 기능, 시동을 키면 정지 상태로 설정됨
    function turnOn() public {
        require(myCar.status == carStatus.turnedOff && myCar.fuelGauage >0/*out of fuel로 변경 가능?*/);
        myCar.status = carStatus.stop;
    }

    // * 주유 기능 - 주유하는 기능, 주유를 하면 1eth를 지불해야하고 연료는 100이 됨
    function reCharge() public payable {
        require(((prePaid >= 10**18 && msg.value ==0) || msg.value == 10**18) && myCar.status == carStatus.turnedOff);
        /*
        prepaid 1 이상, msg.value = 0 -> o
        prepaid 1 이상, msg.value = 1 fin -> x
        prepaid 1 이상, msg.value = 1 eth -> o
        prepaid 1 이하, msg.value = 1 fin -> x
        prepaid 1 이하, msg.value = 1 eth -> x
        */

        if(msg.value != 10**18) {
            prePaid -= 10**18;
        }

        myCar.fuelGauage = 100;
    }

    //* 주유소 사장님은 2번 지갑의 소유자임, 주유소 사장님이 withdraw하는 기능
    function withdraw() public {
        require(owner==msg.sender);
        owner.transfer(address(this).balance);
    }

    // * 지불을 미리 하고 주유시 차감하는 기능
    uint public prePaid;

    function deposit() public payable {
        prePaid += msg.value; /* prePaid = prePaid + msg.value */
    }
}