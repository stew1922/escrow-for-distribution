pragma solidity ^0.5.0;

import "github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/math/SafeMath.sol";

//This is a contract to distribute any amount held in escrow to any
//of the member addresses that are defined at contract creation.

//By default this contract is set up for only 3 members, however, 
//more memebers can be added - just be sure to update the 'distribtuionAmount'
//so that it is divided by the total number of members.

contract vulcanDistributionContract {
    
    using SafeMath for uint;
    
    address payable private partner1;
    address payable private partner2;
    address payable private partner3;
    
    uint private distributionAmount;
    
    //define all the members in the constructor - by default only 3 are defined.
    constructor (address payable _one, address payable _two, address payable _three) public {
        
        partner1 = _one;
        partner2 = _two;
        partner3 = _three;
        
        }

    //'balance' function will simply return the amount currently held in escrow
    function balance() public view returns (uint) {
        
        return address(this).balance;
        
    }
    
    //'distribute' function will distribute all funds in the contracts to the 
    //members defined in the constructor.  Only members can call this function.
    function distribute() public{
        
        uint _balance = address(this).balance;
        
        require(msg.sender == partner1 || msg.sender == partner2 || msg.sender == partner3);
        require(_balance > 0);
        
        distributionAmount = _balance / 3;
        
        partner1.transfer(distributionAmount);
        partner2.transfer(distributionAmount);
        partner3.transfer(distributionAmount);
        
    }
    
    //allows for this contract to recieve funds
    function() external payable{}
}