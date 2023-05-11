// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

// 선생님 입장에서 학생들의 정보 관리하기

contract test {
    struct Student {
        string name;
        uint number;
        uint score;
        string credit;
        string[] classes;
    }

    Student[] students;
    uint numberStudents;
    uint avg;

    // 학생이름을 학생번호로 매핑
    mapping (string => uint) NameToNum;


    // 자동으로 학점을 정해주는 함수
    function setGrade(uint _score) public pure returns(string memory) {
        if(_score>=90) {
            return "A";
        } else if(_score >=80) {
            return "B";
        } else if(_score >=70) {
            return "C";
        } else if(_score >= 60) {
            return "D";
        } else {
            return "F";
        }
    }

    // 학생 추가 기능 - 특정 학생의 정보를 추가
    function pushStudent(string memory _name, uint _score, string[] memory _classes) public {
        string memory _credit = setGrade(_score);
        uint _number = numberStudents + 1;

        students.push(Student(_name, _number, _score, _credit, _classes));
   }

   // 학생 조회 기능(1) - 특정 학생의 번호를 입력하면 그 학생 전체 정보를 반환
   function getStudentByNum(uint _number) public view returns(Student memory) {
       return students[_number-1];
   }

   // 학생 조회 기능(2) - 특정 학생의 이름을 입력하면 그 학생 전체 정보를 반환
   function getStudentByName(string memory _name) public view returns(Student memory) {
       return students[NameToNum[_name]];
   }

   // 학생 점수 조회 기능 - 특정 학생의 이름을 입력하면 그 학생의 점수를 반환
   function getScoreByName(string memory _name) public view returns(uint) {
       return students[NameToNum[_name]].score;
   }

   // 학생 전체 숫자 조회 기능 - 현재 등록된 학생들의 숫자를 반환
   function getAllNum() public view returns(uint) {
       return students.length;
   }

    // 학생 전체 정보 조회 기능 - 현재 등록된 모든 학생들의 정보를 반환
   function getAllStudent() public view returns(Student[] memory) {
       return students;
   }

   // 학생들의 전체 평균 점수 계산 기능 - 학생들의 전체 평균 점수를 반환
   function getAvg() public returns(uint) {
       uint sum;
       for (uint i=0; i<students.length; i++) {
           sum += students[i].score;
       }

       avg = sum / students.length;

       return avg;
   }

   // 선생 지도 자격 자가 평가 시스템 - 학생들의 평균 점수가 70점 이상이면 true, 아니면 false를 반환
   function selfTest() public view returns(bool) {
       bool isWell;

       if (avg >= 70) {
           return !isWell;
       } else {
           return isWell;
       }
   }

    // 보충반 조회 기능 - F 학점을 받은 학생들의 숫자와 그 전체 정보를 반환
    function getF() public view returns(uint){
        uint count;

        for (uint i=0; i<students.length; i++) {
            if (students[i].score < 60) {
                count += 1;
                
            }
        }
    }

    // S반 조회 기능 - 가장 점수가 높은 학생 4명을 S반으로 설정하는데, 이 학생들의 전체 정보를 반환하는 기능 (S반은 4명으로 한정)
    function getS() public {

    }
}