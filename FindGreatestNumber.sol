// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
contract FindGreatestNumber{
    function findlarget(uint[] memory numbers)public pure returns(uint){
        uint  greaterNumber = numbers[0];
        // [1,2,3,4,5,6]
        for(uint i=0; i < numbers.length; i++){
            if(greaterNumber < numbers[i]){
                greaterNumber = numbers[i];
            }
        }
        // [1,2,3,4,5,6]
        return greaterNumber;
    }
}
