// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract StringAndBytes {
    string a;

    function setString(string memory _a) public {
        a = _a;
    }

    function getString() public view returns(string memory) {
        return a;
    }
    
    function StringToBytes() public view returns(bytes memory) {
        return bytes(a);
    }

    function StringToBytes2() public view returns(bytes1, bytes1, bytes1) {
        return (bytes(a)[0], bytes(a)[1], bytes(a)[2]);
    }

    function BytesToString(bytes memory _a) public pure returns(string memory) {
        return string(_a);
    }

// _a의 첫번째 글자를 뽑아내는 것이 목표
    function bytesToString2(string memory _a) public pure returns(bytes1) {
        bytes memory _b; // bytes형 변수 b선언
        _b = bytes(_a); // _b에 _a의 bytes 형변환 정보 대입
        return _b[0];
    }

    function bytesToString3(string memory _a) public pure returns(string memory) {
        bytes memory _b = new bytes(1); // bytes형 변수 b선언
        _b[0] = bytes(_a)[0];
        return string(_b);
    }    

    function bytesToString4(string memory _a, uint _n) public pure returns(string memory) {
        bytes memory _b = new bytes(1);
        _b[0] = bytes(_a)[_n-1];
        return string(_b);
    }
}

contract LocalVariable {
    function A() public pure returns(uint) {
        uint a = 5;
        uint b = 7;
        return (a+b);
    }
}

contract Array {
    // array = 같은 자료형이 들어있는 집합
    uint[] numbers; // 자료형[] 이름
    string[] letters;

    // 1. 넣기
    function push(uint _a) public {
        numbers.push(_a);
    }

    // 2. 빼기
    function pop() public {
        numbers.pop();
    }

    // 3. 보기
    function getNumber(uint _n) public view returns(uint) {
        return numbers[_n-1]; // 배열이름[n번째]
    }

    // 4. 길이
    function getLength() public view returns(uint) {
        return numbers.length; // 배열이름.길이
    }

    // 5. 바꾸기
    function changeNum(uint _k, uint _z) public {
        numbers[_k-1] = _z; // 배열이름[_k번째] 
    }

    // 6. 삭제하기
    function deleteNum(uint8 _n) public {
        delete numbers[_n-1]; // delete 배열이름[_n번째]
    }

    // 7. 전체 array 반환
    function returnArray() public view returns(uint[] memory) {
        return numbers;
    }
}

contract Array_s {
    // array = 같은 자료형들이 들어있는 집합
    string[] letters; // 자료형 [] array 이름

    // 1. 넣기
    function push(string memory _a) public {
        letters.push(_a); // 배열이름.push(변수)
    }

    // 2. 빼기
    function pop() public {
        letters.pop(); // 배열이름.pop(), 맨뒤의 숫자를 날림
    }

    // 3. 보기
    function getLetter(uint _n) public view returns(string memory) {
        return letters[_n-1]; // 배열이름[_n번째]
    }

    // 4. 길이
    function getLength() public view returns(uint) {
        return letters.length; //배열이름.길이
    }

    // 5. 바꾸기
    function changeLet(uint _k, string memory _z) public {
        letters[_k-1] = _z; //배열이름[_k번째] = _z -> _k번째를 _z로 바꿔
    }

    // 6. delete 
    function deleteLet(uint _n) public {
        delete letters[_n-1]; // delete 배열이름[_n번째] = _n번째 숫자를 없애줘
    }

    //7. 전체 array 반환
    function returnArray() public view returns(string[] memory) {
        return letters;
    }
}

contract Struct {
    struct Student {
        string name;
        string gender;
        uint number;
        uint birthday;
    } 
    /* 구조체 선언 
    struct 구조체명 {
        .../
        .../
        ...
    }
    */

    Student s; // Student형 변수 s
    Student[] students; //Student형 변수들의 array students

    function setStudentS(string memory _name, string memory _gender, uint _number, uint _birth) public {
        s = Student(_name, _gender, _number, _birth);
    }

    function getStudentS() public view returns(Student memory) {
        return s;
    }

    function pushStudent(string memory _name, string memory _gender, uint _number, uint _birth) public {
        students.push(Student(_name, _gender, _number, _birth)); // 배열명.push(구조체명(구조체 정보들))
    }

    function popStudent() public {
        students.pop();
    }

    function getLength() public view returns(uint) {
        return students.length;
    }

    function getStudent(uint _n) public view returns(Student memory) {
        return students[_n-1];
    }

    function getStudents() public view returns(Student[] memory) {
        return students;
    }
}

contract Errors {
    uint a;

    function add(uint _a, uint _b) public pure returns(uint) {
        return _a+_b;
    }

    /*
    function add(uint _a, uint _b) public returns(uint) {
        a = a + _a + _b;
        return a;
    }

    function add(uint _a, uint _b) public view returns(uint) {
        return a+_a+_b;
    }

    function add(uint _a, uint _c) public pure returns(uint) {
        return _a+_c;
    }

    function add(uint _a, uint _b) public pure returns(uint, uint) {
        return (_a+_a, _a+_b);
    }
    */

    function add(uint _a, uint _b, uint _c) public pure returns(uint) {
        return _a+_b+_c;
    }

    function add2() public pure returns(uint) {
        uint c = 5;
        uint d = 7;
        return c+d;
    }
}