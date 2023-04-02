// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract transfer{
    address owner;
     address payable receiver;
    uint public getValue;
    constructor(){
        owner =msg.sender;
    }
    modifier onlyOwner(){
        require(msg.sender==owner,"you are not the owner");
        _;
    }
    function send() public payable onlyOwner{
        require(msg.value <=3 ether,"you can not transfer more than 3 ether" );
        getValue=msg.value;
    }
    function getAddress(address payable _receiver) public payable onlyOwner{
        receiver= _receiver;
        receiver.transfer(getValue);
    }
}