# externalTruffleProject

## A simply smart contract to demonstrate External calls. It requires the bank to report all the bank transactions to the government.

Complete Steps to call an EXTERNAL smart contract :  

 > 1. get the address of the contract we need to interact with
 > 2. know the smart contract's location
 > 3. know the smart contract's function's definition are e.g. its parameters, return values
 > 4. then interact with it and add its address
 > 5. optional, sending money to an external call
 > 
   - 5.1. add payable
      - from Bank.sol
          ```
            interface GovernmentInterface {
                       function addTransaction(address _from, address _top, uint _amount) external payable; 
                    }
           ```       
       - from Government.sol
       ```
           function addTransaction(address _ from, address _top, uint _amount) external payable{
                            logs.push(Transaction(_from, _to, _amount, logs.length));
                    }
       ```
   - 5.2. add {value}
       ```
           instance.addTransaction{value: 1 ether}.(msg.sender, recipient, amount);  
       ```

Test :
> 1. deploy Bank.sol
> 2. In Remix, click 'Deposit", Value = 2 ether
> 3. grab another address (call it address 2)
> 4. paste address 2 besides the transfer(address recipient, uint amount) button and an amount
     then click transfer
> 5. Then go to the Government smart contract and click "getTransaction"

Migrate (run from the terminal and make sure your Ganache is open) :
> - D:\blockchain\externalTruffleProject> truffle console (only if you are not in the console yet)
> - truffle(development)> migrate --reset (only use migrate if this is your first time) 
> 
    Compiling your contracts...
    ===========================
    > Compiling .\contracts\Bank.sol
    > Compiling .\contracts\Destroyable.sol
    > Compiling .\contracts\Government.sol
    > Compiling .\contracts\Migrations.sol
    > Compiling .\contracts\Ownable.sol
    > Artifacts written to D:\blockchain\externalTruffleProject\build\contracts
    > Compiled successfully using:
       - solc: 0.8.10+commit.fc410830.Emscripten.clang



    Starting migrations...
    ======================
    > Network name:    'development'
    > Network id:      5777
    > Block gas limit: 6721975 (0x6691b7)


    1_initial_migration.js
    ======================

       Deploying 'Migrations'
       ----------------------
       > transaction hash:    0x2eb1e00fdab1558b36f41bca93fc301ddb446d11cf8a0878fc64950dd7cd3b3f
       > Blocks: 0            Seconds: 0
       > contract address:    0x055d454E204b4f04C407820ee99362D3cF910075
       > block number:        245
       > block timestamp:     1641806175
       > account:             0x949CE02E352E9Ed86AdcCeC797474Efaf6034e91
       > balance:             93.879891919987
       > gas used:            248854 (0x3cc16)
       > gas price:           20 gwei
       > value sent:          0 ETH
       > total cost:          0.00497708 ETH


       > Saving migration to chain.
       > Saving artifacts
       -------------------------------------
       > Total cost:          0.00497708 ETH


    Summary
    =======
    > Total deployments:   1
    > Final cost:          0.00497708 ETH


    - Blocks: 0            Seconds: 0
    - Saving migration to chain.
