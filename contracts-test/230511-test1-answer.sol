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

    // 학점은 점수에 따라 자동으로 계산되어 기입하게 합니다. 90점 이상 A, 80점 이상 B, 70점 이상 C, 60점 이상 D, 나머지는 F 입니다.
    function setCredit(uint _score) public pure returns(string memory) {
        if(_score >=90) {
            return "A";
        } else if(_score >=80) {
            return "B";
        } else if(_score >=70) {
            return "C";
        }else if(_score >=60) {
            return "D";
        }else {
            return "F";
        }
    } 

    // * 학생 추가 기능 - 특정 학생의 정보를 추가
    // 번호는 1번부터 시작하여 정보를 기입하는 순으로 순차적으로 증가합니다.
    function pushStudent(string memory _name, uint _score, string[] memory _classes) public {
        students.push(Student(_name, /*count++*/ students.length+1, _score, setCredit(_score), _classes));
        name_Student[_name] = Student(_name, students.length, _score, setCredit(_score), _classes);
    }

    //* 학생 전체 숫자 조회 기능 - 현재 등록된 학생들의 숫자를 반환
    function getStudentsNumber() public view returns(uint) {
        return students.length;
    }

    //* 학생 전체 정보 조회 기능 - 현재 등록된 모든 학생들의 정보를 반환
    function getAllStudents() public view returns(Student[] memory) {
        return students;
    }

    // * 학생 조회 기능(1) - 특정 학생의 번호를 입력하면 그 학생 전체 정보를 반환
    function getStudent(uint _number) public view returns(Student memory) {
        return students[_number-1];
    }

    mapping(string => Student) name_Student;
    // * 학생 조회 기능(2) - 특정 학생의 이름을 입력하면 그 학생 전체 정보를 반환
    function getStudent2(string memory _name) public view returns(Student memory) {
        return name_Student[_name];
    }

    // * 학생 점수 조회 기능 - 특정 학생의 이름을 입력하면 그 학생의 점수를 반환
    function getStudentScore(string memory _name) public view returns(uint) {
        return name_Student[_name].score;
    }

    // * 학생들의 전체 평균 점수 계산 기능 - 학생들의 전체 평균 점수를 반환
    function getAverage() public view returns(uint) {
        uint totalScore;
        for(uint i=0; i<students.length; i++) {
            totalScore = totalScore + students[i].score; // totalScore += students[i].score
        }

        return totalScore / students.length; // totalScore / getStudentsNumber() -> 똑같이 작동하는지 확인
    }

    // * 선생 지도 자격 자가 평가 시스템 - 학생들의 평균 점수가 70점 이상이면 true, 아니면 false를 반환
    function selfEva() public view returns(bool) {
        if(getAverage() >=70) {
            return true;
        } else {
            return false;
        }
    }

    // * 보충반 조회 기능 - F 학점을 받은 학생들의 숫자와 그 전체 정보를 반환
    function FClass() public view returns(Student[] memory) {
        uint num;

        for(uint i=0; i<students.length;i++) {
            if(keccak256(bytes(students[i].credit)) == keccak256(bytes("F"))) {
                num++;
            }
        }

        Student[] memory F_Storage = new Student[](num);

        uint _num;

        for(uint i=0; i<students.length;i++) {
            if(keccak256(bytes(students[i].credit)) == keccak256(bytes("F"))) {
                F_Storage[_num]=students[i];
            }
            _num++;
        }

        return F_Storage;
    }

    function FClass2() public view returns(/*Student[] memory*/ uint, uint, Student[] memory) {
        Student[] memory F_Students = students;
        Student[] memory F_Storage;

        uint count;

        for(uint i=0; i<students.length; i++) {
            if(keccak256(bytes(students[i].credit)) == keccak256(bytes("F"))) {
                count++;
                F_Students[count-1] = students[i];
                F_Storage = new Student[](count);
                for(uint j=0; j<count; j++) {
                    F_Storage[j] = F_Students[j];
                }
            }
        }
        return (F_Storage.length, count, F_Storage);
    }

    function SClass() public view returns(Student[] memory){
        Student[] memory S_Students = students;
        Student[] memory S_Class = new Student[](4);

        for(uint i=0;i<S_Students.length-1;i++) {
            for(uint j=i+1; j<S_Students.length ;j++) {
                if(S_Students[i].score < S_Students[j].score) {
                    (S_Students[i], S_Students[j]) = (S_Students[j], S_Students[i]);
                }
            }
        }

        for(uint i=0; i<4; i++) {
            S_Class[i] = S_Students[i];
        }

        return S_Class;
    }
}

contract Sorting {
    uint[] numbers;

    function push(uint _n) public {
        numbers.push(_n);
    }

    function sorting() public {
        for (uint i=0; i<numbers.length-1; i++) {
            for (uint j=i+1; j<numbers.length; j++) {
                if (numbers[i] < numbers[j]) {
                    (numbers[i], numbers[j]) = (numbers[j], numbers[i]);
                }
            }
        }
    }

    function sorting2() public {
        for(uint j=1; j<numbers.length; j++) {
            for(uint i=0; i<j; i++) {
                if (numbers[i] < numbers[j]) {
                    (numbers[i], numbers[j]) = (numbers[j], numbers[i]);
                }
            }
        }
    }

    function get() public view returns(uint[] memory) {
        return numbers;
    }
}