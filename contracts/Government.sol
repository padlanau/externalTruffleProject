// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/**
 * @title  Government  
 * @author Lodgerio Padlan
 * @dev    For demo purposess, deploy this one first to get its smart contract    
 * @notice A simply smart contract to demonstrate External calls    
           It requires the bank to report all the bank transactions 
*/

 contract Government {

     struct Transaction {

         address from;
         address to;
         uint amount;
         uint transactionId;
     }

        Transaction[] logs;

        function addTransaction(address _from, address _to, uint _amount) external {
            logs.push(Transaction(_from, _to, _amount, logs.length));
        }

        function getTransaction(uint _index) public view returns(address, address, uint) {
            return(logs[_index].from, logs[_index].to, logs[_index].amount);
        }

         function getBalance() public view returns(uint) {
            return address(this).balance;
         }   

 }
