// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

// * 보충반 조회 기능 - F 학점을 받은 학생들의 숫자와 그 전체 정보를 반환

// * S반 조회 기능 - 가장 점수가 높은 학생 4명을 S반으로 설정하는데, 이 학생들의 전체 정보를 반환하는 기능 (S반은 4명으로 한정)

contract practice {
    struct Student {
        string name;
        uint number;
        uint score;
        string credit;
        string[] classes;
    }

    Student[] students;

    mapping (string => Student) StudentName;

    // 90점 이상 A, 80점 이상 B, 70점 이상 C, 60점 이상 D, 나머지는 F 입니다.
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

    // * 학생 추가 기능 - 특정 학생의 정보를 추가
    function pushStudent(string memory _name, uint _score, string[] memory _classes) public {
        students.push(Student(_name, students.length+1, _score, setCredit(_score), _classes));
        StudentName[_name] = Student(_name, students.length, _score, setCredit(_score), _classes);
    }

    // * 학생 조회 기능(1) - 특정 학생의 번호를 입력하면 그 학생 전체 정보를 반환
    function getStudentByNumber(uint _number) public view returns(Student memory) {
        return students[_number-1];
    }

    // * 학생 조회 기능(2) - 특정 학생의 이름을 입력하면 그 학생 전체 정보를 반환
    function getStudentByName(string memory _name) public view returns(Student memory) {
        return StudentName[_name];
    }

    // * 학생 점수 조회 기능 - 특정 학생의 이름을 입력하면 그 학생의 점수를 반환
    function getScore(string memory _name) public view returns(uint) {
        return StudentName[_name].score;
    }

    // * 학생 전체 숫자 조회 기능 - 현재 등록된 학생들의 숫자를 반환
    function getAllStudentsNum() public view returns(uint) {
        return students.length;
    }

    // * 학생 전체 정보 조회 기능 - 현재 등록된 모든 학생들의 정보를 반환
    function getAllStudents() public view returns(Student[] memory) {
        return students;
    }

    // * 학생들의 전체 평균 점수 계산 기능 - 학생들의 전체 평균 점수를 반환
    function getAvg() public view returns(uint) {
        uint totalScore;
        for (uint i=0; i<students.length; i++) {
            totalScore += students[i].score;
        }
        return totalScore / students.length;
    }
    
    // * 선생 지도 자격 자가 평가 시스템 - 학생들의 평균 점수가 70점 이상이면 true, 아니면 false를 반환
    function selfEval() public view returns(bool) {
        if (getAvg() >= 70) {
            return true;
        } else {
            return false;
        }
    }

    // * 보충반 조회 기능 - F 학점을 받은 학생들의 숫자와 그 전체 정보를 반환
    function getFClass() public view returns(uint, Student[] memory) {
        uint num;
        
        for (uint i=0; i<students.length; i++) {
            if (keccak256(bytes(students[i].credit)) == keccak256(bytes("F"))) {
                num ++;
            }
        }

        Student[] memory F_Students = new Student[](num);

        uint _num;

        for (uint i=0; i<students.length; i++) {
            if (keccak256(bytes(students[i].credit)) == keccak256(bytes("F"))) {
                F_Students[_num] = students[i];
            }
            _num ++;
        }
        return (num, F_Students);

    }

    // * S반 조회 기능 - 가장 점수가 높은 학생 4명을 S반으로 설정하는데, 이 학생들의 전체 정보를 반환하는 기능 (S반은 4명으로 한정)
    function getSClass() public view returns(Student[] memory) {
        Student[] memory S_Students = students;
        // Student[] memory S_Class;

        for (uint i=0; i<students.length-1; i++) {
            for (uint j=i+1; j<students.length; j++) {
                if (S_Students[i].score < S_Students[j].score) {
                    (S_Students[i], S_Students[j]) = (S_Students[j], S_Students[i]);
                }
            }
        }
        Student[] memory S_Class = new Student[](4);
        uint num;

        for (uint i=0; i<4; i++) {
            S_Class[num] = S_Students[i];
            num ++;
        }
        return S_Class;
    }
}