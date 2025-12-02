// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;


import "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";


contract StakingApp is Ownable{
    
    address public stakingToken;

    constructor(address _stakingToken, address _owner) Ownable(_owner){
        stakingToken = _stakingToken;
    }




    
}