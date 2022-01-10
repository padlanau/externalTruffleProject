// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/**
 * @title  Ownable  
 * @author Lodgerio Padlan
 * @dev        
 * @notice A simply smart contract to demonstrate External calls    
           It requires the bank to report all the bank transactions 
*/

 contract Ownable {

    address internal owner;
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _; //run the function
    }
    
    constructor(){
        owner = msg.sender;
    }
 }