// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract OddOrEven{
    function CheckEven(uint _number)public pure returns(bool){
        if(_number % 2 == 0){
            return true;
        }
            else{
                return false;
            }
        }
}
