// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract QUIZ6 {

    // 안건은 번호, 제목, 내용, 제안자(address) 그리고 찬성자 수와 반대자 수로 이루어져 있습니다.
    struct Agenda {
        uint number;
        string title;
        string content;
        address proposer;
        uint supporters;
        uint dissenters;
    }

    mapping (string => Agenda) title_agenda;
    mapping (Agenda => Agenda) myAgenda_agenda;

    // 안건들을 모아놓은 자료구조도 구현하세요.
    Agenda[] public agendas;

    // 사용자는 자신의 이름과 주소, 자신이 만든 안건 그리고 자신이 투표한 안건과 어떻게 투표했는지(찬/반)에 대한 정보[string => bool]로 이루어져 있습니다.(구조체)
    struct User {
        string name;
        address account;
        Agenda myAgenda;
        mapping (string => bool) agendaInfo; 
    }

    User[] users;

    // 사용자 등록 기능 - 사용자를 등록하는 기능
    function register(string memory _name) public {
        users.push(User(_name, msg.sender, ,agendaInfo[])); // 매핑 추가 어케하지
    }

    // 투표하는 기능 - 특정 안건에 대하여 투표하는 기능, 안건은 제목으로 검색, 이미 투표한 건에 대해서는 재투표 불가능
    function voting(string memory _title) public {
        

    }

    // 안건 제안 기능 - 자신이 원하는 안건을 제안하는 기능
    function agendaPropose(string memory _title, string memory _content) public {
        agendas.push(Agenda(agendas.length+1, _title, _content, msg.sender, 0, 0));
        title_agenda[_title] = Agenda(agendas.length, _title, _content, msg.sender, 0, 0);
    }


    // 전체 안건 확인 기능 - 제목으로 안건을 검색하면 번호, 제목, 내용, 제안자, 찬반 수 모두를 반환하는 기능
    function getAllAgenda(string memory _title) public view returns(Agenda memory) {
        return title_agenda[_title];
    }
}
