// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

/*
실습 가이드
1. setTeacher_Student 해보기
2. getTeacher_Student 해보기
3. setTeacher_Class -> 같은 선생이름으로 여러명 학생 해보기
4. getTeacher_Class -> 3번에서 설정한 선생이름으로 해보기 -> 3번에서 등록한 학생 모두 나오는지 확인
*/

contract MAPPING {
    struct Student{
        uint number;
        string name;
        string[] classes;
    }

    mapping(string => Student) Teacher_Student;
    mapping(string => Student[]) Teacher_Class;

    function setTeacher_Student(string memory _Teacher,uint number,string memory name,string[] memory classes) public {
        Teacher_Student[_Teacher] = Student(number,name,classes);
    }
    
    function getTeacher_Student(string memory _Teacher) public view returns(Student memory) {
        return Teacher_Student[_Teacher];
    }

    function setTeacher_Class(string memory _Teacher, uint _number, string memory _name, string[] memory _classes) public {
        Teacher_Class[_Teacher].push(Student(_number, _name, _classes));
    }

    function getTeacher_Class(string memory _Teacher) public view returns(Student[] memory) {
        return Teacher_Class[_Teacher];
    }
}