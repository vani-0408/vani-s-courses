// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
/*
VPKToken
VPK
18
100000000000000000000

*/

contract VPKToken{
    string public name;
    string public symbol;
    uint public decimals;
    uint totalSupply;
    event Transfer(address indexed _from, address indexed _to,uint _value);
    event Approval(address indexed _owner, address indexed _spender,uint _value);
    mapping (address => uint)public balanceOf;
    mapping (address => mapping (address => uint))public allowance;
    constructor(string memory _name, string memory _symbol, uint _decimals, uint _totalSupply){
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupply= _totalSupply;
        balanceOf[msg.sender] += totalSupply;
    }
    function transfer(address _to, uint _value)external returns(bool){
        require(_to != address(0), "ERC20: Invalid to Address");
        require(balanceOf[msg.sender] >= _value, "ERC20: InSufficient Amount");
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return  true;
    }
    function approve(address _spender, uint _value)external returns(bool){
         require(_spender != address(0), "ERC20: Invalid to Address");
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
    function transferFrom(address _from, address _to, uint _values)external returns(bool){
     require(_from != address(0), "ERC20: Invalid _from Address");
     require(_to != address(0), "ERC20: Invalid _to Address");
     require(allowance[_from][_to] >= _values, "ERC20: Insuffient Allowence");
     allowance[_from][_to] -= _values;
     balanceOf[_from] -= _values;
    balanceOf[_to] += _values;
    return true;
    }
}
