/*
안건을 올리고 이에 대한 찬성과 반대를 할 수 있는 기능을 구현하세요. 안건은 번호, 제목, 내용, 제안자(address) 그리고 찬성자 수와 반대자 수로 이루어져 있습니다.(구조체)
안건들을 모아놓은 자료구조도 구현하세요. 

사용자는 자신의 이름과 주소, 자신이 만든 안건 그리고 자신이 투표한 안건과 어떻게 투표했는지(찬/반)에 대한 정보[string => bool]로 이루어져 있습니다.(구조체)

* 사용자 등록 기능 - 사용자를 등록하는 기능
* 투표하는 기능 - 특정 안건에 대하여 투표하는 기능, 안건은 제목으로 검색, 이미 투표한 건에 대해서는 재투표 불가능
* 안건 제안 기능 - 자신이 원하는 안건을 제안하는 기능
* 제안한 안건 확인 기능 - 자신이 제안한 안건에 대한 현재 진행 상황 확인기능 - (번호, 제목, 내용, 찬반 반환 // 밑의 심화 문제 풀었다면 상태도 반환)
* 전체 안건 확인 기능 - 제목으로 안건을 검색하면 번호, 제목, 내용, 제안자, 찬반 수 모두를 반환하는 기능
-------------------------------------------------------------------------------------------------
* 안건 진행 과정 - 투표 진행중, 통과, 기각 상태를 구별하여 알려주고 전체의 70% 그리고 투표자의 66% 이상이 찬성해야 통과로 변경, 둘 중 하나라도 만족못하면 기각
*/

// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/*
안건을 올리고 이에 대한 찬성과 반대를 할 수 있는 기능을 구현하세요. 
안건은 번호, 제목, 내용, 제안자(address) 그리고 찬성자 수와 반대자 수로 이루어져 있습니다.(구조체)
안건들을 모아놓은 자료구조도 구현하세요. 

사용자는 자신의 이름과 주소, 자신이 만든 안건 그리고 자신이 투표한 안건과 어떻게 투표했는지(찬/반)에 대한 정보[string => bool]로 이루어져 있습니다.(구조체)

* 사용자 등록 기능 - 사용자를 등록하는 기능
* 투표하는 기능 - 특정 안건에 대하여 투표하는 기능, 안건은 제목으로 검색, 이미 투표한 건에 대해서는 재투표 불가능
* 안건 제안 기능 - 자신이 원하는 안건을 제안하는 기능
* 제안한 안건 확인 기능 - 자신이 제안한 안건에 대한 현재 진행 상황 확인기능 - (번호, 제목, 내용, 찬반 반환 // 밑의 심화 문제 풀었다면 상태도 반환)
* 전체 안건 확인 기능 - 제목으로 안건을 검색하면 번호, 제목, 내용, 제안자, 찬반 수 모두를 반환하는 기능
-------------------------------------------------------------------------------------------------
* 안건 진행 과정 - 투표 진행중, 통과, 기각 상태를 구별하여 알려주고 전체의 70% 그리고 투표자의 66% 이상이 찬성해야 통과로 변경, 둘 중 하나라도 만족못하면 기각
*/

contract Q6 {
    struct poll {
        uint number;
        string title;
        string context;
        address by;
        uint pros;
        uint cons;
        pollStatus status;
    }

    // poll을 관리할 자료구조 , array or mapping
    mapping(string => poll) public polls;     // * 전체 안건 확인 기능 - 제목으로 안건을 검색하면 번호, 제목, 내용, 제안자, 찬반 수 모두를 반환하는 기능
    uint public count;

    enum votingStatus {
        notVoted,
        pro,
        con
    }

    enum pollStatus {
        ongoing,
        passed,
        rejected
    }

    struct user {
        uint number;
        string name;
        address addr;
        string[] suggested;
        mapping(string=>votingStatus) voted;
    }

    // user를 관리할 자료구조 , array or mapping
    user[] public Users;

    function getUsersLength() public view returns(uint) {
        return Users.length;
    }

    function pushUser(uint _number, string memory _name, address _addr) public {
        user storage _newuser = Users.push();
        Users[Users.length-1].number = _number;
        Users[Users.length-1].name = _name;
        Users[Users.length-1].addr = msg.sender;
    }

    // * 투표하는 기능 - 특정 안건에 대하여 투표하는 기능, 안건은 제목으로 검색, 이미 투표한 건에 대해서는 재투표 불가능
    function vote(uint number, string memory _title, bool _vote) public {
        require(Users[number].voted[_title]==votingStatus.notVoted); //투표자가 해당 안건에 대해서 투표를 안했어야 함
        // 찬성이냐, 반대이냐
        if(_vote==true) {
            polls[_title].pros++;
            Users[number].voted[_title] = votingStatus.pro;
        } else {
            polls[_title].cons++;
            Users[number].voted[_title] = votingStatus.con;
        }
    }

    // * 안건 제안 기능 - 자신이 원하는 안건을 제안하는 기능
    function suggest(string calldata _title, string calldata _context, address _addr) public {
        polls[_title] = poll(++count, _title, _context, _addr, 0,0, pollStatus.ongoing);
    }

    // * 전체 안건 확인 기능 - 제목으로 안건을 검색하면 번호, 제목, 내용, 제안자, 찬반 수 모두를 반환하는 기능
    function getPoll(string memory _title) public view returns(poll memory) {
        return polls[_title];
    }
}

contract User {
    Q6 polls;

    constructor(address _a) {
        polls = Q6(_a);
    }

    enum votingStatus {
        notVoted,
        pro,
        con
    }

    struct user {
        uint number;
        string name;
        address addr;
        string[] suggested;
        mapping(string=>votingStatus) voted;
    }

    user MyAccount;

    function setUser(string memory _name) public {
        (MyAccount.number, MyAccount.name, MyAccount.addr) = (polls.getUsersLength(), _name, msg.sender);
        polls.pushUser(MyAccount.number, _name, msg.sender);
    }

    modifier voting(string memory _title, bool _vote) {
        _;
        if(_vote == true) {
            MyAccount.voted[_title] = votingStatus.pro;
        } else {
            MyAccount.voted[_title] = votingStatus.con;
        }
    }

    function vote(string calldata _title, bool _vote) public voting(_title, _vote) {
        polls.vote(MyAccount.number, _title, _vote);
    }

    function suggestPoll(string calldata _title, string calldata _context) public {
        polls.suggest(_title, _context, msg.sender);
    }
}

    /*
        // * 사용자 등록 기능 - 사용자를 등록하는 기능
    function setUser(string memory _name) public {
        user storage _newuser = Users.push();
        // Users[Users.length-1].number = Users.length;
        Users[Users.length-1].name = _name;
        Users[Users.length-1].addr = msg.sender;
    }

    function getUsers() public view returns(uint) {
        return(Users.length);
    }

    function getUser(uint _n) public view returns(string memory, address, string[] memory) {
        return (Users[_n].name, Users[_n].addr, Users[_n].suggested);
    }

    function getUser2(uint _n, string memory _a) public view returns(string memory, address, string[] memory) {
        return (Users[_n].name, Users[_n].addr, Users[_n].suggested);
    }

    */