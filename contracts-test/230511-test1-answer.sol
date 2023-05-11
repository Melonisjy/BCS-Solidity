// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract QUIZ1 {
    // 학생의 정보는 이름, 번호, 점수, 학점 그리고 듣는 수업들
    struct Student {
        string name;
        uint number;
        uint score;
        string credit;
        string[] classes;
    }

    Student[] students;

    // 학생 번호 -> students.length+1 로 대체
    // uint count = 1;

    function setCredit(uint _score) public pure returns(string memory) {
        if (_score >= 90) {
            return "A";
        } else if (_score >= 80) {
            return "B";
        } else if (_score >= 70) {
            return "C";
        } else if (_score >= 60) {
            return "D";
        } else {
            return "F";
        }
    }

    function pushStudent(string memory _name, uint _score, string[] memory _classes) public {
        students.push(Student(_name, students.length + 1, _score, setCredit(_score), _classes));
        name_Student[_name] = Student(_name, students.length + 1, _score, setCredit(_score), _classes);
    }

    // 학생 전체 숫자 조회 기능 - 현재 등록된 학생들의 숫자를 반환
    function getStudentNumber() public view returns(uint) {
        return students.length;
    }

    // 학생 전체 정보 조회 기능 - 현재 등록된 모든 학생들의 정보를 반환
    function getAllStudents() public view returns(Student[] memory) {
        return students;
    }

    // 학생 조회 기능(1) - 특정 학생의 번호를 입력하면 그 학생 전체 정보를 반환
    function getStudent(uint _number) public view returns(Student memory) {
        return students[_number-1];
    }

    mapping(string => Student) name_Student;
    // 학생 조회 기능(2) - 특정 학생의 이름을 입력하면 그 학생 전체 정보를 반환
    function getStudent2(string memory _name) public view returns(Student memory) {
        return name_Student[_name];
    }

    // 학생 점수 조회 기능 - 특정 학생의 이름을 입력하면 그 학생의 점수를 반환
    function getStudentScore(string memory _name) public view returns(uint) {
        return name_Student[_name].score;
    }

    // 학생들의 전체 평균 점수 계산 기능 - 학생들의 전체 평균 점수를 반환
    function getAverage() public view returns(uint) {
        uint totalScore;
        for (uint i=0; i<students.length; i++) {
            totalScore += students[i].score;
        }
        return totalScore / students.length;
    }

    // 선생 지도 자격 자가 평가 시스템 - 학생들의 평균 점수가 70점 이상이면 true, 아니면 false를 반환
    function selfEva() public view returns(bool) {
        if (getAverage() >= 70) {
            return true;
        } else {
            return false;
        }
    }

    // 보충반 조회 기능 - F 학점을 받은 학생들의 숫자와 그 전체 정보를 반환  
    function FClass() public view returns(uint, Student[] memory) {
        uint num;

        // Student[] memory F_students = new Student[](num);

        for (uint i=0; i<students.length; i++) {
            if (keccak256(bytes(students[i].credit)) == keccak256(bytes("F"))) {
                num ++;
            }
        }

        uint _num;
        Student[] memory F_students = new Student[](_num);
        for (uint i=0; i<students.length; i++) {
            if (keccak256(bytes(students[i].credit)) == keccak256(bytes("F"))) {
                F_students[_num] = students[i];
                _num ++;
            }
        }
        return (_num, F_students);
    }

    
}

contract STRING_Compare {
    function compare1(string memory s1) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(s1));
    }

    function keccak2(string memory s1) public pure returns(bytes32) {
        return keccak256(bytes(s1));
    }

    function compare1(string memory s1, string memory s2) public pure returns(bool) {
        return keccak256(bytes(s1)) == keccak256(bytes(s2));
    }

    function compare2(string memory s1) public pure returns(bytes memory, bytes memory) {
        return (abi.encodePacked(s1), bytes(s1));
    }
}

contract DynamicArray {
    function DA() public pure returns(uint) {
        string[] memory a = new string[](4);

        a = new string[](6);
        return a.length;
    }
}