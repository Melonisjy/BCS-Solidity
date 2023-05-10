// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract IF {
   // 점수가 50점이상이면 P, 아니면 F
   function setGrade(uint _score) public pure returns(string memory) {
      if(_score >=50) { /*if(조건문), <- 이번 경우는 _score가 50보다 높을 때*/
         return "P";
      } else {
         return "F";
      }
   }

   // 점수가 70점이상이면 A, 50점 이상이면 B, 아니면 C반
   function setGrade2(uint _score) public pure returns(string memory) {
      if(_score >=70) {
         return "A";
      } else if(_score >=50) {
         return "B";
      } else {
         return "C";
      }
   }

   // 짝수면 even array에, 홀수면 odd array에 넣기
   uint[] even;
   uint[] odd;

   function evenOrOdd(uint _n) public {
      if(_n%2==0) {
         even.push(_n);      
      } else {
         odd.push(_n);
      }
   }

   function getEvenAndOdd() public view returns(uint[] memory, uint[] memory) {
      return (odd, even);
   }

   // 3으로 나누었을 때, 나머지가 1이면 A, 2이면 B, 0이면 C
   uint[] A;
   uint[] B;
   uint[] C;

   function ternary(uint _n) public {
      if(_n%3==1) {
         A.push(_n);
      } else if(_n%3==2) {
         B.push(_n);
      } else {
         C.push(_n);
      }
   }

   struct student {
      uint number;
      string name;
      uint score;
      string credit;
   }
   /*
   1. Alice , 90 => seta()
   2. Bob, 75 => setb()
   3. Charlie, 86 => setC()
   */

   student Alice;
   student Bob;
   student Charlie;

   // 학생 정보 중 번호, 이름, 점수만 입력하면 학점은 자동 계산해 주는 함수
   // 점수가 90점 이상이면 A, 80점 이상이면 B, 70점 이상이면 C, 나머지는 F
   function setAlice(uint _number, string memory _name, uint _score) public {
      string memory _credit;
      if(_score>=90) {
         _credit = 'A';
      } else if(_score >=80) {
         _credit = 'B';
      } else if(_score >=70) {
         _credit = 'C';
      } else {
         _credit = 'F';
      }

      Alice = student(_number, _name, _score, _credit);
   }

   function setBob(uint _number, string memory _name, uint _score) public {
      string memory _credit;
      if(_score>=90) {
         _credit = 'A';
      } else if(_score >=80) {
         _credit = 'B';
      } else if(_score >=70) {
         _credit = 'C';
      } else {
         _credit = 'F';
      }

      Bob = student(_number, _name, _score, _credit);
   }

   function setCharlie(uint _number, string memory _name, uint _score) public {
      string memory _credit;
      if(_score>=90) {
         _credit = 'A';
      } else if(_score >=80) {
         _credit = 'B';
      } else if(_score >=70) {
         _credit = 'C';
      } else {
         _credit = 'F';
      }

      Charlie = student(_number, _name, _score, _credit);
   }

   function getStudents() public view returns(student memory, student memory, student memory) {
      return (Alice, Bob, Charlie);
   }
}

contract IF2 {
   struct student {
      uint number;
      string name;
      uint score;
      string credit;
   }

   student a;
   student b;
   student c;

   student[] Students;

   function getStudentsABC() public view returns(student memory, student memory, student memory) {
      return (a, b, c);
   }

   function pushStudent(uint _number, string memory _name, uint _score) public {
      string memory _credit;
      if(_score>=90) {
         _credit = 'A';
      } else if(_score >=80) {
         _credit = 'B';
      } else if(_score >=70) {
         _credit = 'C';
      } else {
         _credit = 'F';
      }
      Students.push(student(_number, _name, _score, _credit));
   }

   function pushStudent2(uint _number, string memory _name, uint _score) public {
       Students.push(student(_number, _name, _score, setGrade(_score)));
   }

   function getStudents() public view returns(student[] memory) {
      return Students;
   }

   function setGrade(uint _score) public pure returns(string memory) {
      if(_score>=90) {
         return 'A';
      } else if(_score >=80) {
         return 'B';
      } else if(_score >=70) {
         return 'C';
      } else {
         return 'F';
      }
   }
}

contract IF3 {
    // 50보다 크거나 10보다 작으면 -> or ||
    // 50보다 크고 3의 배수이면 -> and
    function setNumber(uint _n) public pure returns(string memory) {
        if (_n >= 50 || _n < 10) {
            return "A";
        } else if (_n >= 50 && _n % 3 == 0) {
            return "B";
        } else {
            return "C";
        }
    }
}

contract ENUM {
    enum Food {
        Chicken,
        Suish,
        Bread,
        Coconut
    }

    Food a;
    Food b;
    Food c;

    function setA() public {
        a = Food.Chicken;
    }

    function setB() public {
        b = Food.Suish;
    }

    function setC() public {
        c = Food.Bread;
    }

    function getABC() public view returns(Food, Food, Food) {
        return (a, b, c);
    }

    // uint8과 형변환 가능
    function getABC2() public view returns(uint8, uint8, uint8) {
        return (uint8(a), uint8(b), uint8(c));
    }
}

contract ENUM2 {
    enum color {
        Green,
        Red,
        Yellow,
        Blue,
        Purple
    }

    color C;

    function setC() public {
        C = color.Red;
    }

    function setC2(uint _n) public {
        C = color(_n);
    }

    function getC() public view returns(color){
        return C;
    }
}

contract ENUM3 {
    enum Status {
        neutral,
        high,
        low
    }
    Status st;

    uint a = 5;

    function higher() public {
        a ++;
        setA();
    }

    function lower() public {
        a --;
        setA();
    }

        function setA() public {
        if (a>=7) {
            st = Status.high;
        } else if (a<=3) {
            st = Status.low;
        } else {
            st = Status.neutral;
        }
    }

    function getA() public view returns(uint) {
        return a;
    }

    function getST() public view returns(Status) {
        return st;
    }
}

contract BOOL {
    bool isFun;

    function getVar() public view returns(bool) {
        return isFun;
    }

    function Fun() public {
        isFun = true;
    }

    function notFun() public {
        isFun = false;
    }

    function Fun(bool _a) public {
        isFun = _a;
    }
}