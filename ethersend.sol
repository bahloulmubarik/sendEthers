// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.18;

contract sendEthers{
     //address of owner in which we are sending ethers
     
     address owner;
     
     //reciever address
     
     address payable receiver;
    uint public getValue;
    
    //using constructor for only owner can send ethers
    constructor(){
        owner =msg.sender;
    }
    modifier onlyOwner(){
        require(msg.sender==owner,"you are not the owner");
        _;
    }
    
    //function that owner can send only 3 ethers not more than 3
    
    function send() public payable onlyOwner{
        require(msg.value <=3 ether,"you can not transfer more than 3 ether" );
        getValue=msg.value;
    }
    function getAddress(address payable _receiver) public payable onlyOwner{
        receiver= _receiver;
        receiver.transfer(getValue);
    }
}
