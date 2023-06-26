// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol'; 

contract Token_A is ERC20("A_token", "A") {
    constructor(uint a) {
        _mint(msg.sender, a);
        _mint(address(this), a);
    }

    function decimals() public pure override returns(uint8) {
        return 0;
    }
}

contract Token_B is ERC20("B_token", "B") {
    constructor(uint a) {
        _mint(msg.sender, a);
        _mint(address(this), a);
    }

    function decimals() public pure override returns(uint8) {
        return 0;
    }
}

contract CSMM is ERC20("ABLP_Token", "ABLP"){
    // 토큰 설정
    ERC20 public token_a;
    ERC20 public token_b;

    function tokenSetting(address _a, address _b) public {
        token_a = ERC20(_a);
        token_b = ERC20(_b);
    }

    // x+y=k;
    uint public k;

    //유동성 공급 및 제거
    // 공급
    function provideLiquidity(uint _a) public {
        token_a.transferFrom(tx.origin, address(this), _a);
        token_b.transferFrom(tx.origin, address(this), _a);
        // lp 토큰 지급
        _mint(msg.sender, _a);
        k += _a*2;
    }

    // 제거
    function withdrawLiquidity(uint _a) public {
        // lp 토큰 수령 후 확인
        require(balanceOf(msg.sender) >= _a, "not enough");
        transfer(address(this), _a);

        token_a.transfer(msg.sender, _a);
        token_b.transfer(msg.sender, _a);
        k -= _a*2;
    }

    uint[2] public fees;

    mapping(address => uint[2]) fee_per_provider;

    // 거래
    function swapToken(address _token, uint _amount) public {
        require(_token == address(token_a) || _token == address(token_b));
        uint out = _amount * 99 / 100;
        uint fee = _amount / 100;
        if(_token == address(token_a)) {
            token_a.transferFrom(tx.origin, address(this), _amount);
            token_b.transfer(msg.sender, out);
            fees[1] += fee;
        } else {
            token_b.transferFrom(tx.origin, address(this), _amount);
            token_a.transfer(msg.sender, out);
            fees[0] += fee;
        }
    }

    // 보상(모인 수수료) 지급
    function claimable() public view returns(uint[2] memory) {
        uint ratio = balanceOf(msg.sender) * 100 / totalSupply();
        uint[2] memory _rewards = [fees[0] * ratio / 100, fees[1] * ratio / 100];
        return _rewards;
    }
}