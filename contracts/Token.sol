 // SPDX-License-Identifier: SEE LICENSE IN LICENSE
 pragma solidity ^0.8.9;

 contract Token {
    string public name = "My hardhat token";
    string public symbol = "MHT";

    uint256 public totalSupply = 1000000;

    address public owner;

    mapping (address => uint256) balances;

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value);

    constructor() {
        balances[msg.sender] = totalSupply;
    }

    function transfer(address to, uint256 amount)  external {
        require(balances[msg.sender] >= amount, "Not enough tokens");

        balances[msg.sender] -= amount;
        balances[to] += amount;

        emit Transfer(msg.sender, to, amount);
    }

    function balanceOf(address account) external view returns (uint256) {
        return balances[account];
    }
 }