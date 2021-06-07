pragma solidity ^0.5.0;

import "github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/math/SafeMath.sol";

contract vulcanDistribution {
    
    using SafeMath for uint;
    
    address payable private partner1;
    address payable private partner2;
    address payable private partner3;
    address payable private partner4;
    
    uint private distributionAmount;
    
    constructor (address payable _one, address payable _two, address payable _three) public {
        
        partner1 = _one;
        partner2 = _two;
        partner3 = _three;
        
        }
        
    function balance() public view returns (uint) {
        
        return address(this).balance;
        
    }
    
    function distribute() public{
        
        uint _balance = address(this).balance;
        
        require(msg.sender == partner1 || msg.sender == partner2 || msg.sender == partner3);
        require(_balance > 0);
        
        distributionAmount = _balance / 4;
        
        partner1.transfer(distributionAmount);
        partner2.transfer(distributionAmount);
        partner3.transfer(distributionAmount * 2);
        
    }
    
    
    function() external payable{}
}