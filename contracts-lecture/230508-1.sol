// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract note {
    // 이름, 번호, 생년월일을 담은 student라는 구조체와 제목, 번호, 날짜를 담은 class라는 구조체를 선언하시오.
    struct Student {
        string name;
        uint number;
        uint birth;
    }

    struct Class {
        string title;
        uint number;
        uint date;
    }

    // student형 변수 s 와 class형 변수 c를 선언하시오.
    Student s;
    Class c;

    // s에 값을 부여하는 함수 setS와 c에 값을 부여하는 함수 setC를 각각 구현하시오
    function setS(string memory _name, uint _number, uint _birth) public {
        s = Student(_name, _number, _birth);
    }

    function setC(string memory _title, uint _number, uint _date) public {
        c = Class(_title, _number, _date);
    }

    // 변수 s의 값을 반환받는 함수 getS와 c의 값을 반환받는 함수 getC를 각각 구현하시오.
    function getS() public view returns(Student memory) {
        return s;
    }

    function getC() public view returns(Class memory) {
        return c;
    }

    // student형 변수들이 들어가는 array students와 class형 변수들이 들어가는 array classes를 선언하시오.
    Student[] students;
    Class[] classes;

    // students에 student 구조체를 넣는 pushStudent 함수를 구현하세요.    
    function pushStudent(string memory _name, uint _number, uint _birth) public {
        students.push(Student(_name, _number, _birth));
    }

    // classes에 class 구조체를 넣는 pushClass 함수를 구현하세요.
    function pushClass(string memory _title, uint _number, uint _date) public {
        classes.push(Class(_title, _number, _date));
    }

    // 숫자형 변수 a, 문자형 변수 b, bytes2형 변수 c를 담은 구조체 D를 선언하세요.
    struct D{
        uint a;
        string b;
        bytes2 c;
    }

    // D형 변수 dd를 선언하세요.
    D dd;

    // dd에 값을 부여하는 setDD함수를 구현하세요.
    function setDD(uint _a, string memory _b, bytes2 _c) public {
        dd = D(_a, _b, _c);
    }

    // dd의 값을 반환하는 getDD 함수를 구현하세요.
    function getDD() public view returns(D memory) {
        return dd;
    }

    // D형 변수들이 들어가는 array Ds를 선언하세요.
    D[] Ds;

    // Ds에 새로운 D형 변수를 넣는 pushD 함수를 구현하세요.
    function pushD(uint _a, string memory _b, bytes2 _c) public {
        Ds.push(D(_a, _b, _c));
    }

    function pushD2() public {
        Ds.push(dd);
    }

    // Ds array의 n번째 요소를 반환받는 getN이라는 함수를 구현하세요.
    function getN(uint _n) public view returns(D memory) {
        return Ds[_n-1];
    } 


}