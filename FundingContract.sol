// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract FundingContract{
    address owner;
    //Function to assign the owner
    constructor(){
        owner = msg.sender;
    }
    //To store user balance
    mapping(address => uint)private userBalance;
    //To store contract balance
    mapping (address => uint)private contractBalance;
    //Function to get Ether
    function fundMe()public payable {
        userBalance[msg.sender] += msg.value;
        contractBalance[address(this)] += msg.value;
    }
    //Raw transaction used to receive ether
    receive() external payable { 
        userBalance[msg.sender] += msg.value;
        contractBalance[address(this)] += msg.value;
    }

    //Function to withdraw ether
    function withdraw()public payable  {
        require(msg.sender == owner,"Error: Not a Owner!");
        (bool sucess,)=msg.sender.call{value:address(this).balance}("");
        require(sucess);
    }
    

}
