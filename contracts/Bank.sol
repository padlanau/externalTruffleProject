// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "./Ownable.sol";
import "./Destroyable.sol";


/**
 * @title  Bank  
 * @author Lodgerio Padlan
 * @dev    Complete Steps to call an EXTERNAL smart contract   

            Steps:
            1. get the address of the contract we need to interact with
            2. know the smart contract's location
            3. know the smart contract's function's definition are e.g. its parameters, return values
            4. then interact with it and add its address
          
            5. optional, sending money to an external call

                5.1. add payable
                    // from Bank.sol
                    interface GovernmentInterface {
                       function addTransaction(address _from, address _top, uint _amount) external payable; 
                    }

                    // from Government.sol
                    function addTransaction(address _ from, address _top, uint _amount) external payable{
                            logs.push(Transaction(_from, _to, _amount, logs.length));
                    }

                5.2. add {value}
                    instance.addTransaction{value: 1 ether}.(msg.sender, recipient, amount);                     

            Test
            1. deploy Bank.sol
            2. In Remix, click 'Deposit", Value = 2 ether
            3. grab another address (call it address 2)
            4. paste address 2 besides the transfer(address recipient, uint amount) button and an amount
               then click transfer
            5. Then go to the Government smart contract and click "getTransaction"


 * @notice A simply smart contract to demonstrate External calls    
           It requires the bank to report all the bank transactions 
*/

    // step (2) and (3)
    interface GovernmentInterface {
        function addTransaction(address _from, address _top, uint _amount) external; 
    }


contract Bank is Ownable, Destroyable {
    
    // step (4a)
    GovernmentInterface instance  = GovernmentInterface(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);

    mapping(address => uint) balance;
    
    event depositDone(uint amount, address indexed depositedTo);
    
    function deposit() public payable returns (uint)  {
        balance[msg.sender] += msg.value;
        emit depositDone(msg.value, msg.sender);
        return balance[msg.sender];
    }
    
    function withdraw(uint amount) public onlyOwner returns (uint){
        require(balance[msg.sender] >= amount);
        payable(msg.sender).transfer(amount);
        return balance[msg.sender];
    }
    
    function getBalance() public view returns (uint){
        return balance[msg.sender];
    }
    
    function transfer(address recipient, uint amount) public {
        require(balance[msg.sender] >= amount, "Balance not sufficient");
        require(msg.sender != recipient, "Don't transfer money to yourself");
        
        uint previousSenderBalance = balance[msg.sender];
        
        _transfer(msg.sender, recipient, amount);
        
        // step (4b)
        instance.addTransaction(msg.sender, recipient, amount);
        
  


        assert(balance[msg.sender] == previousSenderBalance - amount);
    }
    
    function _transfer(address from, address to, uint amount) private {
        balance[from] -= amount;
        balance[to] += amount;
    }
    
} 
