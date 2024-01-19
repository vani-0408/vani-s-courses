// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
contract FindFactorial{
    function facttorial(uint _number)public pure returns(uint){
        uint result = 1;
        for(uint i = 1; i <= _number; i++){
            result *= i;

        }
        return result;
    }
}
