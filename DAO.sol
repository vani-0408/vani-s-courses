// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
contract DAO{
     //member1 &owner: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
    //mwmbwer2: 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db
    //member3: 0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB
    //new member4: 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
    //["0x5B38Da6a701c568545dCfcB03FcB875f56beddC4","0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db","0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB"]

    address public owner;
       //store the DAO members
    address[] DAOmembers;
    //check new or existing members
    mapping(address=>bool)private ExistingMember;
    //approve or not
    mapping(address => mapping(address => bool))private  ApprovedStatus;
    constructor(address[] memory members){
        owner=msg.sender;
        for(uint i=0;  i< members.length; i++){
            if(ExistingMember[members[i]] != true){
                DAOmembers.push(members[i]);
                ExistingMember[members[i]] = true;
            }
            else{
                revert("Already Existing Member");
            }
        }
    }
    //how to store the information and define the members details
    struct  Member{

        uint id;
         address addr;
        uint approved;
    }
    //To store the members request
    Member[] public AppliedMembers;
    //function to store Members request
    function applyForEntry(address _addr)public {//member1,member2...
        require(ExistingMember[msg.sender] != true, "Error, Already Registered");
        if(AppliedMembers.length !=0 ){
            for(uint i=0; i < AppliedMembers.length; i++){
             if(AppliedMembers[i].addr != _addr){
                    AppliedMembers.push(
                     Member({

                        id:AppliedMembers.length,
                        addr:_addr,
                        approved:0
                        })
                    );
                }
                else{
                         revert("Already Existing ADRRESS");
                    }
            }
        
         }
         else {
            AppliedMembers.push(
                            Member({
                                id:AppliedMembers.length,
                                addr:_addr,
                                approved:0
                            })
                        );
         }
         
    }
    //Function to approve the member request
    function approveEntry(address _applicant)public {
        require(ApprovedStatus[msg.sender][_applicant]==false,"Error:Already Approved");
        require(ExistingMember[msg.sender] != false, "Error: only DAO member");
        for(uint i=0; i< AppliedMembers.length; i++){
            if(AppliedMembers[i].addr == _applicant){
                AppliedMembers[i].approved += 1;
                ApprovedStatus[msg.sender][_applicant]=true;

            }
        }

    }
    //Find user if Memb, er or not
    function isMember(address _user)public returns(bool){
       require(ExistingMember[_user] != true, "Error, Already Registered");
       uint eligibility= (30 * DAOmembers.length)/100;
       for(uint i=0; i < AppliedMembers.length;i++){
        if(AppliedMembers[i].addr== _user && AppliedMembers[i].approved >= eligibility){
            ExistingMember[_user]=true;
            DAOmembers.push(_user);
            return true;
        }
       }
       return false;
    }
    //Function to ready info about DAO
    function totalMembers()public view returns(uint){
        require(ExistingMember[msg.sender] == true, "Error: only DAO Members");
        return DAOmembers.length;
    }

}
