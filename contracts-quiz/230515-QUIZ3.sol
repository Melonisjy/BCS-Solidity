// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract QUIZ3 {

    // 자동차의 상태에는 정지, 운전중, 시동 끔, 연료없음 총 4가지 상태가 있습니다.
    enum Status {
        stop,
        driving,
        turnOff,
        noFuel
    }   

    Status status;

    uint speed;
    uint fuel;

    address CEO = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
    address payable owner;

    constructor() payable {
        owner = payable(msg.sender);
    }
    
    // 악셀 기능 - 속도를 1 올리는 기능, 악셀 기능을 이용할 때마다 연료가 2씩 줄어듬, 연료가 30이하면 더 이상 악셀을 이용할 수 없음, 70이상이면 악셀 기능은 더이상 못씀
    function accel() public {
        require(fuel>30 && speed<70, "can't use accel.");
        speed++;
        fuel -= 2;
    }

    // 브레이크 기능 - 속도를 1 줄이는 기능, 속도가 0인 상태, 브레이크 기능을 이용할 때마다 연료가 1씩 줄어듬, 속도가 0이면 브레이크는 더이상 못씀
    function brake() public {
        require(speed!=0, "can't use brake.");
        speed--;
        fuel -= 1;
        if (speed==0) {
            status = Status.stop;
        }
    }
    
    // 시동 끄기 기능 - 시동을 끄는 기능, 속도가 0이 아니면 시동은 꺼질 수 없음
    function TurnOff() public {
        require(speed==0, "can't use TurnOff.");
        status = Status.turnOff;
    }

    // 시동 켜기 기능 - 시동을 켜는 기능, 시동을 키면 정지 상태로 설정됨
    function TurnOn() public {
        speed = 0;
        status = Status.stop;
    }

    receive() external payable {}

    // 주유 기능 - 주유하는 기능, 주유를 하면 1eth를 지불해야하고 연료는 100이 됨
    function reFuel() public payable returns(uint) {
        require(msg.value == 1 ether, "It's not 1 ether.");
        fuel = 100;
        return msg.value;
    }

    // 주유소 사장님은 2번 지갑의 소유자임, 주유소 사장님이 withdraw하는 기능
    function withdraw() public {
        require(msg.sender == CEO, "only CEO can transfer");
        owner.transfer(1 ether);
    }

    function getFuel() public view returns(uint){
        return fuel;
    }

    function getSpeed() public view returns(uint){
        return speed;
    }

    function getOwner() public view returns(address) {
        return owner;
    }

    // 지불을 미리 하고 주유시 차감하는 기능 ???
}