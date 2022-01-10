# externalTruffleProject

A simply smart contract to demonstrate External calls. It requires the bank to report all the bank transactions to the government.

Complete Steps to call an EXTERNAL smart contract :  

 > 1. get the address of the contract we need to interact with
 > 2. know the smart contract's location
 > 3. know the smart contract's function's definition are e.g. its parameters, return values
 > 4. then interact with it and add its address
 > 5. optional, sending money to an external call
 >    5.1. add payable
           // from Bank.sol
              interface GovernmentInterface {
                  function addTransaction(address _from, address _top, uint _amount) external payable; 
              }

           // from Government.sol
               function addTransaction(address _ from, address _top, uint _amount) external payable{
                      logs.push(Transaction(_from, _to, _amount, logs.length));
               }

  >    5.2. add {value}
                    instance.addTransaction{value: 1 ether}.(msg.sender, recipient, amount);                     

Test :
> 1. deploy Bank.sol
> 2. In Remix, click 'Deposit", Value = 2 ether
> 3. grab another address (call it address 2)
> 4. paste address 2 besides the transfer(address recipient, uint amount) button and an amount
     then click transfer
> 5. Then go to the Government smart contract and click "getTransaction"
