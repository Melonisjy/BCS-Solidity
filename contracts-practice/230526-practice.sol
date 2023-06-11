// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract AToken is ERC20("MelonToken", "MLT") {
    constructor (uint totalSupply) {
        _mint(msg.sender, totalSupply);
    }

    function MintToken(uint a) public {
        _mint(address(this), a);
    }

    function decimals() public pure override returns(uint8) {
        return 0;
    }

    receive() external payable{}
}

contract getFunctionID {
    function firstFourBytes(bytes20 _a) public pure returns(bytes4) {
        return bytes4(_a);
    }
    
    function getMethodID(string calldata _a) public pure returns(bytes4) {
        return bytes4(keccak256(bytes(_a)));
    }
}